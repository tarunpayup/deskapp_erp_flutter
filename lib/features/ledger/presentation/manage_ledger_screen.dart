import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Ledger list/management screen — legacy o-t-ledger-manage.php
/// (documents/map.md Module 4): filter by name/account-type/status,
/// toggle Active/Not Active, delete (blocked if the ledger has journal
/// history — "mark Not Active instead").
class ManageLedgerScreen extends ConsumerStatefulWidget {
  const ManageLedgerScreen({super.key});

  @override
  ConsumerState<ManageLedgerScreen> createState() => _ManageLedgerScreenState();
}

class _ManageLedgerScreenState extends ConsumerState<ManageLedgerScreen> {
  String _search = '';
  String? _status;
  String? _accountType;

  @override
  Widget build(BuildContext context) {
    final ledgersAsync = ref.watch(
      _filteredLedgersProvider((status: _status, accountType: _accountType, search: _search)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Ledgers', style: Theme.of(context).textTheme.headlineMedium),
            ),
            FilledButton.icon(
              onPressed: () => context.go('/office/ledger/add'),
              icon: const Icon(Icons.add),
              label: const Text('Add Ledger'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _FilterBar(
          search: _search,
          status: _status,
          accountType: _accountType,
          onSearchChanged: (v) => setState(() => _search = v),
          onStatusChanged: (v) => setState(() => _status = v),
          onAccountTypeChanged: (v) => setState(() => _accountType = v),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: ledgersAsync.when(
              data: (ledgers) => _LedgerTable(ledgers: ledgers),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ),
      ],
    );
  }
}

typedef _Filter = ({String? status, String? accountType, String search});

final _filteredLedgersProvider =
    StreamProvider.family<List<LedgerTableData>, _Filter>((ref, filter) {
      final repo = ref.watch(ledgerRepositoryProvider);
      return repo.watchLedgers(
        status: filter.status,
        accountType: filter.accountType,
        search: filter.search,
      );
    });

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.search,
    required this.status,
    required this.accountType,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onAccountTypeChanged,
  });

  final String search;
  final String? status;
  final String? accountType;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onAccountTypeChanged;

  @override
  Widget build(BuildContext context) {
    final allTypes = accountTypeGroups.expand((g) => g.types).toList()..sort();

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search by name or code',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: onSearchChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String?>(
            value: accountType,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Account Type'),
            items: [
              const DropdownMenuItem(value: null, child: Text('All types')),
              ...allTypes.map(
                (t) => DropdownMenuItem(
                  value: t,
                  child: Text(t, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
            onChanged: onAccountTypeChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String?>(
            value: status,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Status'),
            items: const [
              DropdownMenuItem(value: null, child: Text('All statuses')),
              DropdownMenuItem(value: 'Active', child: Text('Active')),
              DropdownMenuItem(value: 'Not Active', child: Text('Not Active')),
            ],
            onChanged: onStatusChanged,
          ),
        ),
      ],
    );
  }
}

class _LedgerTable extends ConsumerWidget {
  const _LedgerTable({required this.ledgers});
  final List<LedgerTableData> ledgers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ledgers.isEmpty) {
      return const Center(child: Text('No ledgers found'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: ledgers.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final l = ledgers[i];
        return ListTile(
          onTap: () => context.go('/office/ledger/edit/${l.lid}'),
          title: Text(l.accountName, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(
            '${accountTypeDisplayLabel(l.accountType)}'
            '${l.accountCode.isNotEmpty ? ' • ${l.accountCode}' : ''}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                MoneyFormat.withDrCr(l.currentBalance),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: l.currentBalance >= 0 ? AppColors.debit : AppColors.credit,
                ),
              ),
              const SizedBox(width: 20),
              Switch(
                value: l.status == 'Active',
                onChanged: (_) =>
                    ref.read(ledgerRepositoryProvider).toggleStatus(l.lid),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: AppColors.danger,
                onPressed: () => _confirmDelete(context, ref, l),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    LedgerTableData ledger,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete ledger?'),
        content: Text('Delete "${ledger.accountName}"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
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
      await ref.read(ledgerRepositoryProvider).deleteLedger(ledger.lid);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}
