import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Karigar list — legacy fo-tr-view-karigar.php (documents/map.md Module
/// 3): tap row to edit, inline Active/Not Active toggle, current balance
/// shown with the rule #4 sign convention (positive = Payable, negative =
/// Advance).
class KarigarListScreen extends ConsumerStatefulWidget {
  const KarigarListScreen({super.key});

  @override
  ConsumerState<KarigarListScreen> createState() => _KarigarListScreenState();
}

class _KarigarListScreenState extends ConsumerState<KarigarListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final karigarsAsync = ref.watch(_karigarsProvider(_search));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Karigars', style: Theme.of(context).textTheme.headlineMedium),
            ),
            FilledButton.icon(
              onPressed: () => context.go('/factory/karigar/add'),
              icon: const Icon(Icons.add),
              label: const Text('Add Karigar'),
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
            child: karigarsAsync.when(
              data: (karigars) {
                if (karigars.isEmpty) return const Center(child: Text('No karigars found'));
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: karigars.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final k = karigars[i];
                    return ListTile(
                      onTap: () => context.go('/factory/karigar/edit/${k.karigarId}'),
                      title: Text(k.karigarName, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('${k.karigarCode} • ${k.mobile}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FutureBuilder<double>(
                            future: ref.read(karigarRepositoryProvider).getCurrentBalance(k.karigarId),
                            builder: (context, snapshot) {
                              final balance = snapshot.data ?? 0;
                              return Text(
                                '${MoneyFormat.plain(balance.abs())} ${balance >= 0 ? '(Payable)' : '(Advance)'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: balance >= 0 ? AppColors.debit : AppColors.credit,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 20),
                          Switch(
                            value: k.status == 'Active',
                            onChanged: (_) =>
                                ref.read(karigarRepositoryProvider).toggleKarigarStatus(k.karigarId),
                          ),
                        ],
                      ),
                    );
                  },
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

final _karigarsProvider = StreamProvider.family<List<KarigarsTableData>, String>((ref, search) {
  return ref.watch(karigarRepositoryProvider).watchKarigars(search: search);
});
