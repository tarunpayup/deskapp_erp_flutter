import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';
import '../domain/trade_models.dart';
import 'widgets/trader_picker_field.dart';

/// Party-wise product rates — legacy o-tr-party-rates.php (documents/
/// map.md Module 5): pick Customer|Vendor, see/set their per-product rate.
/// One rate per (party, product) — see PartyRatesTable doc for why the
/// unit isn't part of the key.
class PartyRatesScreen extends ConsumerStatefulWidget {
  const PartyRatesScreen({super.key});

  @override
  ConsumerState<PartyRatesScreen> createState() => _PartyRatesScreenState();
}

class _PartyRatesScreenState extends ConsumerState<PartyRatesScreen> {
  TraderType _type = TraderType.customer;
  TradersTableData? _party;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Party Rates', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SegmentedButton<TraderType>(
                segments: TraderType.values
                    .map((t) => ButtonSegment(value: t, label: Text(t.label)))
                    .toList(),
                selected: {_type},
                onSelectionChanged: (s) => setState(() {
                  _type = s.first;
                  _party = null;
                }),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: TraderPickerField(
                key: ValueKey(_type),
                type: _type,
                onSelected: (t) => setState(() => _party = t),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _party == null
              ? const Center(child: Text('Select a party to view/set rates'))
              : _RatesGrid(party: _party!),
        ),
      ],
    );
  }
}

class _RatesGrid extends ConsumerWidget {
  const _RatesGrid({required this.party});
  final TradersTableData party;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(_productsProvider);
    final ratesAsync = ref.watch(_ratesProvider(party.id));

    return productsAsync.when(
      data: (products) => ratesAsync.when(
        data: (rates) {
          final rateByProduct = {for (final r in rates) r.rate.productId: r.rate};
          if (products.isEmpty) {
            return const Center(child: Text('No products yet — add one first'));
          }
          return Card(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final product = products[i];
                final existing = rateByProduct[product.pid];
                return _RateRow(
                  partyId: party.id,
                  product: product,
                  existing: existing,
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

final _productsProvider = StreamProvider<List<ProductsTableData>>((ref) {
  return ref.watch(tradeRepositoryProvider).watchProducts();
});

final _ratesProvider =
    FutureProvider.family<List<({PartyRatesTableData rate, ProductsTableData product})>, int>(
      (ref, partyId) => ref.watch(tradeRepositoryProvider).getPartyRates(partyId),
    );

class _RateRow extends ConsumerStatefulWidget {
  const _RateRow({required this.partyId, required this.product, this.existing});
  final int partyId;
  final ProductsTableData product;
  final PartyRatesTableData? existing;

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
    await ref.read(tradeRepositoryProvider).setPartyRate(
      partyId: widget.partyId,
      productId: widget.product.pid,
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
