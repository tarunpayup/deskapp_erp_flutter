import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/trade_models.dart';

/// Outstanding-balance report — legacy o-tr-customers-report.php /
/// o-tr-vendors-report.php (documents/map.md Module 5), consolidated
/// into one screen parameterized by [TraderType] instead of the legacy's
/// two near-identical duplicated files (down to a duplicated
/// `indianFormat()` helper). All/Date-range filter, summary cards
/// (Total Dr/Cr/Net).
class PartyBalanceReportScreen extends ConsumerStatefulWidget {
  const PartyBalanceReportScreen({super.key, required this.type});

  final TraderType type;

  @override
  ConsumerState<PartyBalanceReportScreen> createState() => _PartyBalanceReportScreenState();
}

class _PartyBalanceReportScreenState extends ConsumerState<PartyBalanceReportScreen> {
  DateTime? _from;
  DateTime? _to;

  @override
  Widget build(BuildContext context) {
    final reportAsync = ref.watch(
      _reportProvider((type: widget.type, from: _from, to: _to)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('${widget.type.label} Report', style: Theme.of(context).textTheme.headlineMedium),
            ),
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
              label: Text(
                _from == null
                    ? 'All Time'
                    : '${_from!.year}-${_from!.month.toString().padLeft(2, '0')}-${_from!.day.toString().padLeft(2, '0')}'
                        ' to ${_to!.year}-${_to!.month.toString().padLeft(2, '0')}-${_to!.day.toString().padLeft(2, '0')}',
              ),
            ),
            if (_from != null)
              IconButton(
                onPressed: () => setState(() {
                  _from = null;
                  _to = null;
                }),
                icon: const Icon(Icons.clear),
                tooltip: 'Clear date filter',
              ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: reportAsync.when(
            data: (rows) {
              final totalDebit = rows.fold<double>(0, (s, r) => s + r.debit);
              final totalCredit = rows.fold<double>(0, (s, r) => s + r.credit);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          label: 'Total Dr',
                          value: MoneyFormat.plain(totalDebit),
                          color: AppColors.debit,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          label: 'Total Cr',
                          value: MoneyFormat.plain(totalCredit),
                          color: AppColors.credit,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          label: 'Net',
                          value: MoneyFormat.plain(totalDebit - totalCredit),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Card(
                      child: rows.isEmpty
                          ? const Center(child: Text('No parties found'))
                          : ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: rows.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, i) {
                                final r = rows[i];
                                return ListTile(
                                  title: Text(r.trader.traderName),
                                  subtitle: Text(r.trader.traderCode),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          MoneyFormat.plain(r.debit),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(color: AppColors.debit),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          MoneyFormat.plain(r.credit),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(color: AppColors.credit),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

typedef _ReportKey = ({TraderType type, DateTime? from, DateTime? to});

final _reportProvider =
    FutureProvider.family<List<({TradersTableData trader, double debit, double credit})>, _ReportKey>(
      (ref, key) => ref
          .watch(tradeRepositoryProvider)
          .getPartyBalanceReport(type: key.type, from: key.from, to: key.to),
    );

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value, this.color});
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
            Text(label, style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
