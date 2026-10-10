import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Journal listing — legacy o-t-journal.php (documents/map.md Module 4):
/// read-only, expandable per-entry detail (Dr/Cr lines).
class JournalScreen extends ConsumerWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(_journalEntriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Journal', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Expanded(
          child: entriesAsync.when(
            data: (entries) {
              if (entries.isEmpty) {
                return const Center(child: Text('No journal entries yet'));
              }
              return Card(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) => _JournalEntryTile(entry: entries[i]),
                ),
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

final _journalEntriesProvider = StreamProvider<List<JournalEntriesTableData>>((ref) {
  return ref.watch(ledgerRepositoryProvider).watchJournalEntries();
});

class _JournalEntryTile extends ConsumerStatefulWidget {
  const _JournalEntryTile({required this.entry});
  final JournalEntriesTableData entry;

  @override
  ConsumerState<_JournalEntryTile> createState() => _JournalEntryTileState();
}

class _JournalEntryTileState extends ConsumerState<_JournalEntryTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final e = widget.entry;
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _expanded = !_expanded),
          leading: _VoucherTypeBadge(type: e.voucherType),
          title: Text(e.narration?.isNotEmpty == true ? e.narration! : e.voucherNo),
          subtitle: Text('${e.voucherNo} • ${e.entryDate.toString().split(' ').first}'),
          trailing: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        ),
        if (_expanded)
          FutureBuilder<List<({JournalEntryDetailsTableData detail, String accountName})>>(
            future: ref.read(ledgerRepositoryProvider).getEntryDetails(e.entryId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: LinearProgressIndicator(),
                );
              }
              final details = snapshot.data!;
              return Container(
                padding: const EdgeInsets.fromLTRB(56, 0, 16, 12),
                child: Column(
                  children: details.map((d) {
                    final isDebit = d.detail.debit > 0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(child: Text(d.accountName)),
                          Text(
                            MoneyFormat.plain(isDebit ? d.detail.debit : d.detail.credit),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isDebit ? AppColors.debit : AppColors.credit,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(isDebit ? 'Dr' : 'Cr'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _VoucherTypeBadge extends StatelessWidget {
  const _VoucherTypeBadge({required this.type});
  final String type;

  Color get _color => switch (type) {
    'CASH' => AppColors.success,
    'BANK' => AppColors.info,
    'SALES' => AppColors.primary,
    'PURCHASE' => AppColors.warning,
    _ => AppColors.secondary,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        type.isNotEmpty ? type[0] : '?',
        style: TextStyle(color: _color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
