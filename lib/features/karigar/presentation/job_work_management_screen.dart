import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/db/app_database.dart';
import '../domain/karigar_models.dart';

/// Job Work dashboard — legacy karigar_job_management.php's "Job Work"
/// tab (documents/map.md Module 3): list + allot-more/receive/remarks/
/// delete. Tap a row to open its detail actions.
class JobWorkManagementScreen extends ConsumerStatefulWidget {
  const JobWorkManagementScreen({super.key});

  @override
  ConsumerState<JobWorkManagementScreen> createState() => _JobWorkManagementScreenState();
}

class _JobWorkManagementScreenState extends ConsumerState<JobWorkManagementScreen> {
  String? _status;

  @override
  Widget build(BuildContext context) {
    final jobsAsync = ref.watch(_jobsProvider(_status));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Job Work', style: Theme.of(context).textTheme.headlineMedium),
            ),
            SegmentedButton<String?>(
              segments: const [
                ButtonSegment(value: null, label: Text('All')),
                ButtonSegment(value: 'Open', label: Text('Open')),
                ButtonSegment(value: 'Completed', label: Text('Completed')),
              ],
              selected: {_status},
              onSelectionChanged: (s) => setState(() => _status = s.first),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: jobsAsync.when(
              data: (jobs) {
                if (jobs.isEmpty) return const Center(child: Text('No job work found'));
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: jobs.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) => _JobRow(job: jobs[i]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ),
      ],
    );
  }
}

final _jobsProvider = StreamProvider.family<List<KarigarJobWorkTableData>, String?>((ref, status) {
  return ref.watch(karigarRepositoryProvider).watchJobWork(status: status);
});

class _JobRow extends ConsumerWidget {
  const _JobRow({required this.job});
  final KarigarJobWorkTableData job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final karigarAsync = ref.watch(_karigarProvider(job.karigarId));
    return ListTile(
      onTap: () => _openDetail(context, ref),
      title: Row(
        children: [
          Text(job.jobCode, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          karigarAsync.when(
            data: (k) => Text('• ${k?.karigarName ?? ''}'),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(width: 8),
          if (job.isMulti)
            const Chip(label: Text('Multi', style: TextStyle(fontSize: 10)), visualDensity: VisualDensity.compact),
        ],
      ),
      subtitle: Text(
        'Allotted: ${job.quantity.toStringAsFixed(3)} • Received: ${job.quantityRec.toStringAsFixed(3)}',
      ),
      trailing: Chip(
        label: Text(job.status),
        backgroundColor: job.status == 'Completed'
            ? AppColors.success.withValues(alpha: 0.15)
            : AppColors.primary.withValues(alpha: 0.1),
      ),
    );
  }

  Future<void> _openDetail(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _JobDetailSheet(job: job),
    );
  }
}

final _karigarProvider = FutureProvider.family<KarigarsTableData?, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).getKarigar(id);
});

final _jobProvider = FutureProvider.family<KarigarJobWorkTableData?, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).getJobWork(id);
});

class _JobDetailSheet extends ConsumerStatefulWidget {
  const _JobDetailSheet({required this.job});
  final KarigarJobWorkTableData job;

  @override
  ConsumerState<_JobDetailSheet> createState() => _JobDetailSheetState();
}

class _JobDetailSheetState extends ConsumerState<_JobDetailSheet> {
  @override
  Widget build(BuildContext context) {
    final jobAsync = ref.watch(_jobProvider(widget.job.id));
    return jobAsync.when(
      data: (job) => job == null ? const SizedBox.shrink() : _buildSheet(context, job),
      loading: () => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Text('Error: $e'),
    );
  }

  void _refresh() {
    ref.invalidate(_jobProvider(widget.job.id));
    ref.invalidate(_allotmentsProvider(widget.job.id));
    ref.invalidate(_receiptsProvider(widget.job.id));
    ref.invalidate(_remarksProvider(widget.job.id));
  }

  Widget _buildSheet(BuildContext context, KarigarJobWorkTableData job) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(job.jobCode, style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  if (job.status == 'Open')
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      color: AppColors.danger,
                      onPressed: () => _delete(context),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text('Allotted: ${job.quantity.toStringAsFixed(3)} • Received: ${job.quantityRec.toStringAsFixed(3)}'),
              const SizedBox(height: 16),
              if (job.status == 'Open') ...[
                Wrap(
                  spacing: 12,
                  children: [
                    if (!job.isMulti)
                      OutlinedButton.icon(
                        onPressed: () => _allotMoreDialog(context),
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text('Allot More'),
                      ),
                    FilledButton.icon(
                      onPressed: () => job.isMulti ? _receiveMultiDialog(context) : _receiveSingleDialog(context),
                      icon: const Icon(Icons.inventory_2_outlined),
                      label: const Text('Receive'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _remarkDialog(context),
                      icon: const Icon(Icons.comment_outlined),
                      label: const Text('Remark'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
              Text('Allotment History', style: Theme.of(context).textTheme.titleMedium),
              _AllotmentHistory(jobWorkId: job.id),
              const SizedBox(height: 16),
              Text('Receipt History', style: Theme.of(context).textTheme.titleMedium),
              _ReceiptHistory(jobWorkId: job.id),
              const SizedBox(height: 16),
              Text('Remarks', style: Theme.of(context).textTheme.titleMedium),
              _RemarksHistory(jobWorkId: job.id),
            ],
          ),
        );
      },
    );
  }

  Future<void> _delete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete job work?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(karigarRepositoryProvider).deleteJobWork(widget.job.id);
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _allotMoreDialog(BuildContext context) async {
    final ctrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Allot More'),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(labelText: 'Additional Weight'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Allot')),
        ],
      ),
    );
    if (confirmed != true) return;
    final weight = double.tryParse(ctrl.text.trim()) ?? 0;
    try {
      await ref.read(karigarRepositoryProvider).allotMore(
        jobWorkId: widget.job.id,
        weight: weight,
        date: DateTime.now(),
      );
      _refresh();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _receiveSingleDialog(BuildContext context) async {
    final weightCtrl = TextEditingController();
    final valueCtrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Receive'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: weightCtrl,
              decoration: const InputDecoration(labelText: 'Gross Quantity Received'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: valueCtrl,
              decoration: const InputDecoration(
                labelText: 'Net Weight for Wages',
                helperText: 'Used to compute wages — may differ from gross quantity',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Save')),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(karigarRepositoryProvider).receiveSingleItem(
        jobWorkId: widget.job.id,
        weightReceived: double.tryParse(weightCtrl.text.trim()) ?? 0,
        receiveValue: double.tryParse(valueCtrl.text.trim()) ?? 0,
        date: DateTime.now(),
      );
      _refresh();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _receiveMultiDialog(BuildContext context) async {
    final lines = await ref.read(karigarRepositoryProvider).getJobWorkLines(widget.job.id);
    if (!context.mounted) return;
    final controllers = {for (final l in lines) l.id: TextEditingController()};
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Receive'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: lines
                .map(
                  (l) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      controller: controllers[l.id],
                      decoration: InputDecoration(
                        labelText: 'Qty received (pending: ${(l.qtyAllotted - l.qtyReceived).toStringAsFixed(3)})',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Save')),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(karigarRepositoryProvider).receiveMultiItem(
        jobWorkId: widget.job.id,
        date: DateTime.now(),
        lines: controllers.entries
            .map((e) => ReceiptLineInput(
                  jobWorkLineItemId: e.key,
                  qtyReceivedNow: double.tryParse(e.value.text.trim()) ?? 0,
                ))
            .toList(),
      );
      _refresh();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _remarkDialog(BuildContext context) async {
    final ctrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Remark'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Remark'), maxLines: 3),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Save')),
        ],
      ),
    );
    if (confirmed != true || ctrl.text.trim().isEmpty) return;
    await ref.read(karigarRepositoryProvider).addRemark(
      jobWorkId: widget.job.id,
      remark: ctrl.text.trim(),
      date: DateTime.now(),
    );
    _refresh();
  }
}

class _AllotmentHistory extends ConsumerWidget {
  const _AllotmentHistory({required this.jobWorkId});
  final int jobWorkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(_allotmentsProvider(jobWorkId));
    return asyncData.when(
      data: (rows) => rows.isEmpty
          ? const Padding(padding: EdgeInsets.all(8), child: Text('No allotments'))
          : Column(
              children: rows
                  .map(
                    (a) => ListTile(
                      dense: true,
                      title: Text('Weight: ${a.weight.toStringAsFixed(3)}'),
                      subtitle: Text(
                        '${a.allotDate.year}-${a.allotDate.month.toString().padLeft(2, '0')}-${a.allotDate.day.toString().padLeft(2, '0')}',
                      ),
                    ),
                  )
                  .toList(),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

final _allotmentsProvider = FutureProvider.family<List<JobWorkAllotmentsTableData>, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).getAllotments(id);
});

class _ReceiptHistory extends ConsumerWidget {
  const _ReceiptHistory({required this.jobWorkId});
  final int jobWorkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(_receiptsProvider(jobWorkId));
    return asyncData.when(
      data: (rows) => rows.isEmpty
          ? const Padding(padding: EdgeInsets.all(8), child: Text('No receipts yet'))
          : Column(
              children: rows
                  .map(
                    (r) => ListTile(
                      dense: true,
                      title: Text('Credited: ₹${r.amountCredited.toStringAsFixed(2)}'),
                      subtitle: Text(
                        r.weightReceived != null
                            ? 'Received: ${r.weightReceived!.toStringAsFixed(3)} • Net: ${r.receiveValue?.toStringAsFixed(2)}'
                            : '${r.receiveDate.year}-${r.receiveDate.month.toString().padLeft(2, '0')}-${r.receiveDate.day.toString().padLeft(2, '0')}',
                      ),
                    ),
                  )
                  .toList(),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

final _receiptsProvider = FutureProvider.family<List<JobWorkReceiptsTableData>, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).getReceipts(id);
});

class _RemarksHistory extends ConsumerWidget {
  const _RemarksHistory({required this.jobWorkId});
  final int jobWorkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(_remarksProvider(jobWorkId));
    return asyncData.when(
      data: (rows) => rows.isEmpty
          ? const Padding(padding: EdgeInsets.all(8), child: Text('No remarks'))
          : Column(
              children: rows.map((r) => ListTile(dense: true, title: Text(r.remark))).toList(),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

final _remarksProvider = FutureProvider.family<List<JobWorkRemarksTableData>, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).getRemarks(id);
});
