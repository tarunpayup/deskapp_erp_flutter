import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';

/// Day Book report — legacy daybook.php (documents/map.md Module 4):
/// pick a date, see that day's Cash-voucher entries with opening/closing
/// balance. Scoped to Cash-voucher journal entries only for now — see
/// LedgerRepository.getDaybook doc comment (Sales/Procurement/Karigar/
/// Payroll modules don't exist yet to contribute their entries).
class DaybookScreen extends ConsumerStatefulWidget {
  const DaybookScreen({super.key});

  @override
  ConsumerState<DaybookScreen> createState() => _DaybookScreenState();
}

class _DaybookScreenState extends ConsumerState<DaybookScreen> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Day Book', style: Theme.of(context).textTheme.headlineMedium),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => _date = picked);
              },
              icon: const Icon(Icons.calendar_today_outlined, size: 18),
              label: Text(
                '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: FutureBuilder(
            future: ref.read(ledgerRepositoryProvider).getDaybook(_date),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final result = snapshot.data!;
              final totalDebit = result.lines.fold<double>(0, (s, l) => s + l.debit);
              final totalCredit = result.lines.fold<double>(0, (s, l) => s + l.credit);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          label: 'Opening Balance',
                          value: MoneyFormat.withDrCr(result.opening),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          label: 'Closing Balance',
                          value: MoneyFormat.withDrCr(result.closing),
                          warn: result.closing < 0,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SummaryCard(
                          label: 'Net (Dr − Cr)',
                          value: MoneyFormat.plain(totalDebit - totalCredit),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: result.lines.isEmpty
                        ? const Center(child: Text('No cash entries for this date'))
                        : Card(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: result.lines.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, i) {
                                final l = result.lines[i];
                                return ListTile(
                                  title: Text(
                                    l.narration?.isNotEmpty == true
                                        ? l.narration!
                                        : l.voucherType,
                                  ),
                                  subtitle: Text(l.voucherNo),
                                  trailing: Text(
                                    l.debit > 0
                                        ? '+${MoneyFormat.plain(l.debit)}'
                                        : '-${MoneyFormat.plain(l.credit)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: l.debit > 0 ? AppColors.debit : AppColors.credit,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value, this.warn = false});
  final String label;
  final String value;
  final bool warn;

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
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: warn ? AppColors.danger : null,
              ),
            ),
            if (warn)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Cash flow is negative — please check',
                  style: TextStyle(fontSize: 12, color: AppColors.danger),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
