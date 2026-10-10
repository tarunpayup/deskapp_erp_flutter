import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Transaction Report — a flat, filterable listing of every journal line
/// across every account (date range + account type), distinct from the
/// Journal screen (one row per voucher) and the per-account Ledger
/// statement (documents/map.md Executive Summary nav list).
class TransactionReportScreen extends ConsumerStatefulWidget {
  const TransactionReportScreen({super.key});

  @override
  ConsumerState<TransactionReportScreen> createState() => _TransactionReportScreenState();
}

class _TransactionReportScreenState extends ConsumerState<TransactionReportScreen> {
  DateTime? _from;
  DateTime? _to;
  String? _accountType;

  @override
  Widget build(BuildContext context) {
    final allTypes = accountTypeGroups.expand((g) => g.types).toList()..sort();
    final reportAsync = ref.watch(
      _reportProvider((from: _from, to: _to, accountType: _accountType)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Transaction Report', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String?>(
                value: _accountType,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Account Type'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('All types')),
                  ...allTypes.map(
                    (t) => DropdownMenuItem(value: t, child: Text(t, overflow: TextOverflow.ellipsis)),
                  ),
                ],
                onChanged: (v) => setState(() => _accountType = v),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  initialDateRange: _from != null && _to != null
                      ? DateTimeRange(start: _from!, end: _to!)
                      : null,
                );
                if (picked != null) {
                  setState(() {
                    _from = picked.start;
                    _to = picked.end;
                  });
                }
              },
              icon: const Icon(Icons.date_range_outlined, size: 18),
              label: Text(_from == null ? 'All Time' : 'Custom Range'),
            ),
            if (_from != null)
              IconButton(
                onPressed: () => setState(() {
                  _from = null;
                  _to = null;
                }),
                icon: const Icon(Icons.clear),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: reportAsync.when(
              data: (rows) {
                if (rows.isEmpty) return const Center(child: Text('No transactions found'));
                final totalDebit = rows.fold<double>(0, (s, r) => s + r.detail.debit);
                final totalCredit = rows.fold<double>(0, (s, r) => s + r.detail.credit);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text('Total Dr: ${MoneyFormat.plain(totalDebit)}',
                              style: const TextStyle(color: AppColors.debit, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 24),
                          Text('Total Cr: ${MoneyFormat.plain(totalCredit)}',
                              style: const TextStyle(color: AppColors.credit, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: rows.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, i) {
                          final r = rows[i];
                          return ListTile(
                            title: Text(r.account.accountName),
                            subtitle: Text(
                              '${r.entry.voucherType} ${r.entry.voucherNo} • '
                              '${r.entry.entryDate.year}-${r.entry.entryDate.month.toString().padLeft(2, '0')}-${r.entry.entryDate.day.toString().padLeft(2, '0')}'
                              '${r.entry.narration != null && r.entry.narration!.isNotEmpty ? ' • ${r.entry.narration}' : ''}',
                            ),
                            trailing: Text(
                              r.detail.debit > 0
                                  ? '+${MoneyFormat.plain(r.detail.debit)}'
                                  : '-${MoneyFormat.plain(r.detail.credit)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: r.detail.debit > 0 ? AppColors.debit : AppColors.credit,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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

typedef _ReportKey = ({DateTime? from, DateTime? to, String? accountType});

final _reportProvider = FutureProvider.family<
    List<({JournalEntryDetailsTableData detail, JournalEntriesTableData entry, LedgerTableData account})>,
    _ReportKey>((ref, key) {
  return ref
      .watch(ledgerRepositoryProvider)
      .getTransactionReport(from: key.from, to: key.to, accountType: key.accountType);
});
