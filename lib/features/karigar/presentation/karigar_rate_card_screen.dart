import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';

/// Rate-card management — legacy fo-tr-job-rates.php (documents/map.md
/// Module 3 rule #7): pick a karigar (products filtered to that karigar's
/// process), set/edit a rate per product+unit.
class KarigarRateCardScreen extends ConsumerStatefulWidget {
  const KarigarRateCardScreen({super.key});

  @override
  ConsumerState<KarigarRateCardScreen> createState() => _KarigarRateCardScreenState();
}

class _KarigarRateCardScreenState extends ConsumerState<KarigarRateCardScreen> {
  KarigarsTableData? _karigar;

  @override
  Widget build(BuildContext context) {
    final karigarsAsync = ref.watch(_karigarsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Job Rates', style: Theme.of(context).textTheme.headlineMedium),
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
              ? const Center(child: Text('Select a karigar to view/set job rates'))
              : _RateGrid(karigar: _karigar!),
        ),
      ],
    );
  }
}

final _karigarsProvider = StreamProvider<List<KarigarsTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchKarigars();
});

class _RateGrid extends ConsumerWidget {
  const _RateGrid({required this.karigar});
  final KarigarsTableData karigar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(_productsProvider(karigar.workTypeId));
    final ratesAsync = ref.watch(_ratesProvider(karigar.karigarId));

    return productsAsync.when(
      data: (products) => ratesAsync.when(
        data: (rates) {
          if (products.isEmpty) {
            return const Center(child: Text("No products set up for this karigar's process yet"));
          }
          final rateByProduct = {for (final r in rates) r.rate.productId: r.rate};
          return Card(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final product = products[i];
                return _RateRow(
                  karigarId: karigar.karigarId,
                  product: product,
                  existing: rateByProduct[product.id],
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

final _productsProvider = StreamProvider.family<List<KarigarProductsTableData>, int>((ref, workTypeId) {
  return ref.watch(karigarRepositoryProvider).watchKarigarProducts(workTypeId: workTypeId);
});

final _ratesProvider =
    FutureProvider.family<List<({KarigarProductRatesTableData rate, KarigarProductsTableData product})>, int>(
      (ref, karigarId) => ref.watch(karigarRepositoryProvider).getRatesForKarigar(karigarId),
    );

class _RateRow extends ConsumerStatefulWidget {
  const _RateRow({required this.karigarId, required this.product, this.existing});
  final int karigarId;
  final KarigarProductsTableData product;
  final KarigarProductRatesTableData? existing;

  @override
  ConsumerState<_RateRow> createState() => _RateRowState();
}

class _RateRowState extends ConsumerState<_RateRow> {
  late TextEditingController _rateCtrl;
  late String _unit;

  @override
  void initState() {
    super.initState();
    _rateCtrl = TextEditingController(text: widget.existing?.rate.toStringAsFixed(2) ?? '');
    final units = widget.product.units.split(',').where((u) => u.isNotEmpty).toList();
    _unit = widget.existing?.unit ?? (units.isNotEmpty ? units.first : '');
  }

  @override
  void dispose() {
    _rateCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final rate = double.tryParse(_rateCtrl.text.trim());
    if (rate == null || _unit.isEmpty) return;
    await ref.read(karigarRepositoryProvider).setRate(
      karigarId: widget.karigarId,
      productId: widget.product.id,
      unit: _unit,
      rate: rate,
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rate saved for ${widget.product.productName}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final units = widget.product.units.split(',').where((u) => u.isNotEmpty).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(widget.product.productName)),
          Expanded(
            flex: 2,
            child: DropdownButton<String>(
              isExpanded: true,
              value: units.contains(_unit) ? _unit : null,
              items: units.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              onChanged: (v) => setState(() => _unit = v ?? ''),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: TextField(
              controller: _rateCtrl,
              textAlign: TextAlign.right,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(isDense: true, labelText: 'Rate'),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(icon: const Icon(Icons.save_outlined), onPressed: _save),
        ],
      ),
    );
  }
}
