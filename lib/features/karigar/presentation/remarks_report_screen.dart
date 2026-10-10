import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';

/// Remarks-only report — legacy karigar_report.php (documents/map.md
/// Module 3): filterable by karigar, chronological remarks across all of
/// that karigar's job-work lots.
class RemarksReportScreen extends ConsumerStatefulWidget {
  const RemarksReportScreen({super.key});

  @override
  ConsumerState<RemarksReportScreen> createState() => _RemarksReportScreenState();
}

class _RemarksReportScreenState extends ConsumerState<RemarksReportScreen> {
  KarigarsTableData? _karigar;

  @override
  Widget build(BuildContext context) {
    final karigarsAsync = ref.watch(_karigarsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Karigar Remarks Report', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        karigarsAsync.when(
          data: (karigars) => DropdownButtonFormField<KarigarsTableData>(
            value: _karigar,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Karigar'),
            items: karigars
                .map((k) => DropdownMenuItem(value: k, child: Text(k.karigarName, overflow: TextOverflow.ellipsis)))
                .toList(),
            onChanged: (v) => setState(() => _karigar = v),
          ),
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _karigar == null
              ? const Center(child: Text('Select a karigar'))
              : _RemarksList(karigarId: _karigar!.karigarId),
        ),
      ],
    );
  }
}

final _karigarsProvider = StreamProvider<List<KarigarsTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchKarigars();
});

class _RemarksList extends ConsumerWidget {
  const _RemarksList({required this.karigarId});
  final int karigarId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsAsync = ref.watch(_jobsProvider(karigarId));
    return jobsAsync.when(
      data: (jobs) => FutureBuilder<List<({String jobCode, JobWorkRemarksTableData remark})>>(
        future: _loadAllRemarks(ref, jobs),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final rows = snapshot.data!;
          if (rows.isEmpty) return const Center(child: Text('No remarks for this karigar'));
          return Card(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: rows.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final r = rows[i];
                return ListTile(
                  title: Text(r.remark.remark),
                  subtitle: Text(
                    '${r.jobCode} • ${r.remark.remarkDate.year}-${r.remark.remarkDate.month.toString().padLeft(2, '0')}-${r.remark.remarkDate.day.toString().padLeft(2, '0')}',
                  ),
                );
              },
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  Future<List<({String jobCode, JobWorkRemarksTableData remark})>> _loadAllRemarks(
    WidgetRef ref,
    List<KarigarJobWorkTableData> jobs,
  ) async {
    final repo = ref.read(karigarRepositoryProvider);
    final result = <({String jobCode, JobWorkRemarksTableData remark})>[];
    for (final job in jobs) {
      final remarks = await repo.getRemarks(job.id);
      result.addAll(remarks.map((r) => (jobCode: job.jobCode, remark: r)));
    }
    result.sort((a, b) => b.remark.remarkDate.compareTo(a.remark.remarkDate));
    return result;
  }
}

final _jobsProvider = StreamProvider.family<List<KarigarJobWorkTableData>, int>((ref, karigarId) {
  return ref.watch(karigarRepositoryProvider).watchJobWork(karigarId: karigarId);
});
