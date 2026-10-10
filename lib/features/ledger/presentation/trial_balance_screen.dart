import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../domain/ledger_models.dart';

/// Trial Balance report — legacy trial_balance.php (documents/map.md
/// Module 4 rule #6): groups ledgers by account type, sums Dr/Cr per
/// group, flags whether total Dr = total Cr. Sums `current_balance`
/// directly (not journal-derived), same as the legacy app — the legacy
/// "Financial Year" label was cosmetic-only (didn't actually filter data)
/// and is simply not reproduced here rather than shipped as a misleading
/// no-op.
class TrialBalanceScreen extends ConsumerWidget {
  const TrialBalanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(_trialBalanceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trial Balance', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Expanded(
          child: groupsAsync.when(
            data: (groups) => _TrialBalanceBody(groups: groups),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

final _trialBalanceProvider = FutureProvider.autoDispose<List<TrialBalanceGroup>>((ref) {
  return ref.watch(ledgerRepositoryProvider).getTrialBalance();
});

class _TrialBalanceBody extends StatefulWidget {
  const _TrialBalanceBody({required this.groups});
  final List<TrialBalanceGroup> groups;

  @override
  State<_TrialBalanceBody> createState() => _TrialBalanceBodyState();
}

class _TrialBalanceBodyState extends State<_TrialBalanceBody> {
  final Set<String> _expanded = {};

  @override
  Widget build(BuildContext context) {
    final totalDr = widget.groups.fold<double>(0, (s, g) => s + g.totalDebit);
    final totalCr = widget.groups.fold<double>(0, (s, g) => s + g.totalCredit);
    final balanced = (totalDr - totalCr).abs() < 0.01;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: widget.groups.map((g) {
                final isExpanded = _expanded.contains(g.accountType);
                return Column(
                  children: [
                    ListTile(
                      onTap: () => setState(() {
                        isExpanded
                            ? _expanded.remove(g.accountType)
                            : _expanded.add(g.accountType);
                      }),
                      title: Text(
                        accountTypeDisplayLabel(g.accountType),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 140,
                            child: Text(
                              MoneyFormat.plain(g.totalDebit),
                              textAlign: TextAlign.right,
                              style: const TextStyle(color: AppColors.debit),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              MoneyFormat.plain(g.totalCredit),
                              textAlign: TextAlign.right,
                              style: const TextStyle(color: AppColors.credit),
                            ),
                          ),
                          Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                        ],
                      ),
                    ),
                    if (isExpanded)
                      ...g.rows.map(
                        (r) => Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 16, 8),
                          child: Row(
                            children: [
                              Expanded(child: Text(r.accountName)),
                              Text(MoneyFormat.withDrCr(r.balance)),
                            ],
                          ),
                        ),
                      ),
                    const Divider(height: 1),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: balanced
              ? AppColors.success.withValues(alpha: 0.08)
              : AppColors.danger.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  balanced ? Icons.check_circle_outline : Icons.error_outline,
                  color: balanced ? AppColors.success : AppColors.danger,
                ),
                const SizedBox(width: 12),
                Text(
                  balanced
                      ? 'Balanced — Total Dr = Total Cr'
                      : 'Difference: ${MoneyFormat.plain(totalDr - totalCr)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: balanced ? AppColors.success : AppColors.danger,
                  ),
                ),
                const Spacer(),
                Text('Total Dr: ${MoneyFormat.plain(totalDr)}'),
                const SizedBox(width: 24),
                Text('Total Cr: ${MoneyFormat.plain(totalCr)}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
