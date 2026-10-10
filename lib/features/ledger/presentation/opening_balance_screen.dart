import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/ledger_models.dart';

/// Bulk opening-balance grid — legacy enter_opening_balance.php
/// (documents/map.md Module 4 rule #5). Rows for ledgers with existing
/// journal history are locked (grayed out) rather than silently editable,
/// since editing opening balance after transactions exist is the
/// accounting-integrity gap the legacy app had — fixed here by refusing
/// the edit and pointing at an adjustment entry instead (enforced in
/// LedgerRepository.updateOpeningBalances).
class OpeningBalanceScreen extends ConsumerStatefulWidget {
  const OpeningBalanceScreen({super.key});

  @override
  ConsumerState<OpeningBalanceScreen> createState() => _OpeningBalanceScreenState();
}

class _OpeningBalanceScreenState extends ConsumerState<OpeningBalanceScreen> {
  final Map<int, TextEditingController> _controllers = {};
  final Map<int, DrCr> _dcByLid = {};
  bool _saving = false;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextEditingController _controllerFor(LedgerTableData ledger) {
    return _controllers.putIfAbsent(
      ledger.lid,
      () => TextEditingController(text: ledger.openingBalance.abs().toStringAsFixed(2)),
    );
  }

  DrCr _dcFor(LedgerTableData ledger) {
    return _dcByLid.putIfAbsent(ledger.lid, () => DrCr.fromSign(ledger.openingBalance));
  }

  Future<void> _saveAll(List<LedgerTableData> ledgers) async {
    setState(() => _saving = true);
    final updates = <int, ({double amount, DrCr dc})>{};
    for (final l in ledgers) {
      final text = _controllerFor(l).text.trim();
      final amount = double.tryParse(text) ?? 0;
      updates[l.lid] = (amount: amount, dc: _dcFor(l));
    }
    final skipped = await ref.read(ledgerRepositoryProvider).updateOpeningBalances(updates);
    if (mounted) {
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            skipped.isEmpty
                ? 'Opening balances saved'
                : 'Saved. ${skipped.length} account(s) skipped (already have transaction history).',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ledgersAsync = ref.watch(_allLedgersProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Opening Balance', style: Theme.of(context).textTheme.headlineMedium),
            ),
            ledgersAsync.when(
              data: (ledgers) => FilledButton.icon(
                onPressed: _saving ? null : () => _saveAll(ledgers),
                icon: _saving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.save_outlined),
                label: const Text('Save All'),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ledgersAsync.when(
            data: (ledgers) => Card(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: ledgers.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) => _LedgerRow(
                  ledger: ledgers[i],
                  controller: _controllerFor(ledgers[i]),
                  dc: _dcFor(ledgers[i]),
                  onDcChanged: (dc) => setState(() => _dcByLid[ledgers[i].lid] = dc),
                ),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

final _allLedgersProvider = StreamProvider<List<LedgerTableData>>((ref) {
  return ref.watch(ledgerRepositoryProvider).watchLedgers();
});

class _LedgerRow extends ConsumerWidget {
  const _LedgerRow({
    required this.ledger,
    required this.controller,
    required this.dc,
    required this.onDcChanged,
  });

  final LedgerTableData ledger;
  final TextEditingController controller;
  final DrCr dc;
  final ValueChanged<DrCr> onDcChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
      future: ref.read(ledgerRepositoryProvider).hasJournalHistory(ledger.lid),
      builder: (context, snapshot) {
        final locked = snapshot.data ?? false;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    if (locked) ...[
                      const Tooltip(
                        message:
                            'Has transaction history — opening balance is locked. '
                            'Post an adjustment entry instead.',
                        child: Icon(Icons.lock_outline, size: 16, color: AppColors.textMuted),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ledger.accountName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ledger.accountType,
                            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: controller,
                  enabled: !locked,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(isDense: true),
                ),
              ),
              const SizedBox(width: 12),
              DropdownButton<DrCr>(
                value: dc,
                items: const [
                  DropdownMenuItem(value: DrCr.debit, child: Text('Dr')),
                  DropdownMenuItem(value: DrCr.credit, child: Text('Cr')),
                ],
                onChanged: locked ? null : (v) => onDcChanged(v ?? DrCr.debit),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 140,
                child: Text(
                  'Current: ${MoneyFormat.withDrCr(ledger.currentBalance)}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
