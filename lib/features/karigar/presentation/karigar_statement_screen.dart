import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Karigar Statement / Full Report — legacy karigar_full_report.php
/// (documents/map.md Module 3: "the most complex report"). KPI cards
/// (lots/weight/credit-debit-balance) plus a chronological combined
/// ledger of allotments, receipts, and payments. PDF export is not
/// implemented here — the legacy's jsPDF+AutoTable approach has no
/// direct Flutter-native equivalent in this pass; the data this report
/// needs is fully available via KarigarRepository for a future
/// print/share screen.
class KarigarStatementScreen extends ConsumerStatefulWidget {
  const KarigarStatementScreen({super.key});

  @override
  ConsumerState<KarigarStatementScreen> createState() => _KarigarStatementScreenState();
}

class _KarigarStatementScreenState extends ConsumerState<KarigarStatementScreen> {
  KarigarsTableData? _karigar;

  @override
  Widget build(BuildContext context) {
    final karigarsAsync = ref.watch(_karigarsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Karigar Statement', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        karigarsAsync.when(
          data: (karigars) => DropdownButtonFormField<KarigarsTableData>(
            value: _karigar,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Karigar'),
            items: karigars
                .map(
                  (k) => DropdownMenuItem(
                    value: k,
                    child: Text('${k.karigarName} (${k.karigarCode})', overflow: TextOverflow.ellipsis),
                  ),
                )
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
              : _StatementBody(karigar: _karigar!),
        ),
      ],
    );
  }
}

final _karigarsProvider = StreamProvider<List<KarigarsTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchKarigars();
});

class _StatementBody extends ConsumerWidget {
  const _StatementBody({required this.karigar});
  final KarigarsTableData karigar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(_summaryProvider(karigar.karigarId));

    return summaryAsync.when(
      data: (s) => ListView(
        children: [
          Row(
            children: [
              Expanded(child: _Kpi(label: 'Lots Issued', value: '${s.lotsIssued}')),
              const SizedBox(width: 12),
              Expanded(child: _Kpi(label: 'Pending', value: '${s.lotsPending}')),
              const SizedBox(width: 12),
              Expanded(child: _Kpi(label: 'Completed', value: '${s.lotsCompleted}')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _Kpi(label: 'Weight Allotted', value: s.weightAllotted.toStringAsFixed(3))),
              const SizedBox(width: 12),
              Expanded(child: _Kpi(label: 'Weight Received', value: s.weightReceived.toStringAsFixed(3))),
              const SizedBox(width: 12),
              Expanded(child: _Kpi(label: 'Weight Pending', value: s.weightPending.toStringAsFixed(3))),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _Kpi(
                  label: 'Total Credit',
                  value: MoneyFormat.plain(s.totalCredit),
                  color: AppColors.debit,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _Kpi(
                  label: 'Total Debit',
                  value: MoneyFormat.plain(s.totalDebit),
                  color: AppColors.credit,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _Kpi(
                  label: s.balance >= 0 ? 'Balance (Payable)' : 'Balance (Advance)',
                  value: MoneyFormat.plain(s.balance.abs()),
                  color: s.balance >= 0 ? AppColors.debit : AppColors.credit,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Payments & Adjustments', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _PaymentsSection(karigarId: karigar.karigarId),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

final _summaryProvider = FutureProvider.family((ref, int karigarId) {
  return ref.watch(karigarRepositoryProvider).getKarigarStatementSummary(karigarId);
});

class _Kpi extends StatelessWidget {
  const _Kpi({required this.label, required this.value, this.color});
  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentsSection extends ConsumerWidget {
  const _PaymentsSection({required this.karigarId});
  final int karigarId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentsAsync = ref.watch(_paymentsProvider(karigarId));
    return Card(
      child: Column(
        children: [
          paymentsAsync.when(
            data: (payments) {
              if (payments.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('No payments recorded yet'),
                );
              }
              return Column(
                children: payments
                    .map(
                      (p) => ListTile(
                        title: Text(
                          p.amountDr > 0
                              ? 'Paid ₹${p.amountDr.toStringAsFixed(2)}'
                              : 'Credit ₹${p.amountCr.toStringAsFixed(2)}',
                        ),
                        subtitle: Text(
                          '${p.paymentDate.year}-${p.paymentDate.month.toString().padLeft(2, '0')}-${p.paymentDate.day.toString().padLeft(2, '0')}'
                          '${p.note != null && p.note!.isNotEmpty ? ' • ${p.note}' : ''}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: AppColors.danger,
                          onPressed: () => ref.read(karigarRepositoryProvider).deletePayment(p.id),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: () => _addPaymentDialog(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Add Payment/Adjustment'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addPaymentDialog(BuildContext context, WidgetRef ref) async {
    final drCtrl = TextEditingController();
    final crCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Payment/Adjustment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: drCtrl,
              decoration: const InputDecoration(labelText: 'Cash Paid (Dr)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: crCtrl,
              decoration: const InputDecoration(labelText: 'Credit Adjustment (Cr)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextField(controller: noteCtrl, decoration: const InputDecoration(labelText: 'Note')),
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
      await ref.read(karigarRepositoryProvider).addPayment(
        karigarId: karigarId,
        date: DateTime.now(),
        amountDr: double.tryParse(drCtrl.text.trim()) ?? 0,
        amountCr: double.tryParse(crCtrl.text.trim()) ?? 0,
        note: noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
      );
      ref.invalidate(_summaryProvider(karigarId));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

final _paymentsProvider = StreamProvider.family<List<KarigarPaymentsTableData>, int>((ref, id) {
  return ref.watch(karigarRepositoryProvider).watchPayments(id);
});
