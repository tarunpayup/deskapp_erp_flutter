import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/trade_models.dart';

/// Customer/Vendor list — legacy o-tr-trader-view.php (documents/map.md
/// Module 5), unified for both [TraderType]s. Shows the party's current
/// ledger balance (read via its ledger_id FK) rather than re-deriving it.
class TraderListScreen extends ConsumerStatefulWidget {
  const TraderListScreen({super.key, required this.type, required this.addRoute});

  final TraderType type;
  final String addRoute;

  @override
  ConsumerState<TraderListScreen> createState() => _TraderListScreenState();
}

class _TraderListScreenState extends ConsumerState<TraderListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final tradersAsync = ref.watch(
      _tradersProvider((type: widget.type, search: _search)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${widget.type.label}s',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            FilledButton.icon(
              onPressed: () => context.go(widget.addRoute),
              icon: const Icon(Icons.add),
              label: Text('Add ${widget.type.label}'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search by name or code',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (v) => setState(() => _search = v),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: tradersAsync.when(
              data: (traders) => _TraderTable(traders: traders),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ),
      ],
    );
  }
}

typedef _Filter = ({TraderType type, String search});

final _tradersProvider = StreamProvider.family<List<TradersTableData>, _Filter>((ref, filter) {
  return ref
      .watch(tradeRepositoryProvider)
      .watchTraders(type: filter.type, search: filter.search);
});

class _TraderTable extends ConsumerWidget {
  const _TraderTable({required this.traders});
  final List<TradersTableData> traders;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (traders.isEmpty) {
      return const Center(child: Text('No parties found'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: traders.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final t = traders[i];
        return ListTile(
          onTap: () => context.go('/office/${t.traderType == 'Customer' ? 'customers' : 'vendors'}/edit/${t.id}'),
          title: Text(t.traderName, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(
            '${t.traderCode}${t.phone != null && t.phone!.isNotEmpty ? ' • ${t.phone}' : ''}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<LedgerTableData?>(
                future: ref.read(ledgerRepositoryProvider).getLedger(t.ledgerId),
                builder: (context, snapshot) {
                  final balance = snapshot.data?.currentBalance ?? 0;
                  return Text(
                    MoneyFormat.withDrCr(balance),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: balance >= 0 ? AppColors.debit : AppColors.credit,
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              Switch(
                value: t.status == 'Active',
                onChanged: (_) => ref.read(tradeRepositoryProvider).toggleTraderStatus(t.id),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: AppColors.danger,
                onPressed: () => _confirmDelete(context, ref, t),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, TradersTableData trader) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete party?'),
        content: Text('Delete "${trader.traderName}"? This cannot be undone.'),
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
    if (confirmed != true || !context.mounted) return;
    try {
      await ref.read(tradeRepositoryProvider).deleteTrader(trader.id);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}
