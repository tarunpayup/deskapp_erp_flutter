import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/trade_models.dart';
import 'invoice_pdf.dart';
import 'widgets/trader_picker_field.dart';

/// Add Sale + Sales list — legacy o-tr-sales-new.php (v2 baseline, per
/// documents/map.md Module 5) + o-tr-invoices.php. Line items are
/// repeatable rows (product/unit/qty/price), taxable value auto-sums from
/// them with an optional manual override validated against that sum
/// (class doc in trade_repository.dart explains why this differs from the
/// legacy's blind-trust version).
class SalesScreen extends ConsumerStatefulWidget {
  const SalesScreen({super.key});

  @override
  ConsumerState<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends ConsumerState<SalesScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sales', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [Tab(text: 'Add Sale'), Tab(text: 'Sales List')],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [_AddSaleForm(), _SalesListTab()],
          ),
        ),
      ],
    );
  }
}

class _LineRow {
  ProductsTableData? product;
  String unit = '';
  final qtyCtrl = TextEditingController(text: '1');
  final priceCtrl = TextEditingController(text: '0');

  double get qty => double.tryParse(qtyCtrl.text.trim()) ?? 0;
  double get price => double.tryParse(priceCtrl.text.trim()) ?? 0;
  double get taxable => qty * price;

  void dispose() {
    qtyCtrl.dispose();
    priceCtrl.dispose();
  }
}

class _AddSaleForm extends ConsumerStatefulWidget {
  const _AddSaleForm();

  @override
  ConsumerState<_AddSaleForm> createState() => _AddSaleFormState();
}

class _AddSaleFormState extends ConsumerState<_AddSaleForm> {
  final _formKey = GlobalKey<FormState>();
  TradersTableData? _customer;
  DateTime _date = DateTime.now();
  final List<_LineRow> _lines = [_LineRow()];
  final _cgstCtrl = TextEditingController(text: '0');
  final _sgstCtrl = TextEditingController(text: '0');
  final _igstCtrl = TextEditingController(text: '0');
  final _overrideCtrl = TextEditingController();
  bool _useOverride = false;
  bool _loading = false;

  @override
  void dispose() {
    for (final l in _lines) {
      l.dispose();
    }
    _cgstCtrl.dispose();
    _sgstCtrl.dispose();
    _igstCtrl.dispose();
    _overrideCtrl.dispose();
    super.dispose();
  }

  double get _lineSum => _lines.fold<double>(0, (s, l) => s + l.taxable);

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _customer == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select a customer')));
      return;
    }
    if (_lines.any((l) => l.product == null || l.unit.isEmpty || l.qty <= 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fill in every line item')),
      );
      return;
    }
    setState(() => _loading = true);
    try {
      final salesId = await ref.read(tradeRepositoryProvider).addSale(
        traderId: _customer!.id,
        saleDate: _date,
        lines: _lines
            .map(
              (l) => TradeLineItemInput(
                productId: l.product!.pid,
                productName: l.product!.productName,
                unit: l.unit,
                qty: l.qty,
                priceOfProduct: l.price,
              ),
            )
            .toList(),
        taxableValueOverride: _useOverride ? double.tryParse(_overrideCtrl.text.trim()) : null,
        cgstPercent: double.tryParse(_cgstCtrl.text.trim()) ?? 0,
        sgstPercent: double.tryParse(_sgstCtrl.text.trim()) ?? 0,
        igstPercent: double.tryParse(_igstCtrl.text.trim()) ?? 0,
      );
      if (mounted) {
        setState(() {
          _customer = null;
          _lines
            ..forEach((l) => l.dispose())
            ..clear()
            ..add(_LineRow());
          _useOverride = false;
          _overrideCtrl.clear();
        });
        _formKey.currentState?.reset();
        if (context.mounted) {
          await _showInvoiceDialog(context, salesId);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _showInvoiceDialog(BuildContext context, int salesId) async {
    final repo = ref.read(tradeRepositoryProvider);
    final sale = await repo.getSale(salesId);
    if (sale == null) return;
    final lines = await repo.getSaleLines(salesId);
    final trader = await repo.getTrader(sale.traderId);
    if (!context.mounted || trader == null) return;

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sale recorded'),
        content: Text('Invoice ${sale.salesCode} created for ${trader.traderName}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              final bytes = await buildSaleInvoicePdf(sale: sale, trader: trader, lines: lines);
              await Printing.layoutPdf(onLayout: (_) async => bytes, name: '${sale.salesCode}.pdf');
            },
            icon: const Icon(Icons.visibility_outlined),
            label: const Text('View'),
          ),
          FilledButton.icon(
            onPressed: () async {
              final bytes = await buildSaleInvoicePdf(sale: sale, trader: trader, lines: lines);
              await Printing.sharePdf(bytes: bytes, filename: '${sale.salesCode}.pdf');
            },
            icon: const Icon(Icons.share_outlined),
            label: const Text('Share'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cgst = double.tryParse(_cgstCtrl.text.trim()) ?? 0;
    final sgst = double.tryParse(_sgstCtrl.text.trim()) ?? 0;
    final igst = double.tryParse(_igstCtrl.text.trim()) ?? 0;
    final taxable = _useOverride ? (double.tryParse(_overrideCtrl.text.trim()) ?? 0) : _lineSum;
    final total = taxable + taxable * (cgst + sgst + igst) / 100;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TraderPickerField(
                          type: TraderType.customer,
                          onSelected: (t) => setState(() => _customer = t),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) setState(() => _date = picked);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(labelText: 'Sale Date'),
                            child: Text(
                              '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Line Items', style: Theme.of(context).textTheme.titleMedium),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () => setState(() => _lines.add(_LineRow())),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Line'),
                      ),
                    ],
                  ),
                  ..._lines.asMap().entries.map(
                    (entry) => _LineItemRow(
                      line: entry.value,
                      onChanged: () => setState(() {}),
                      onRemove: _lines.length > 1
                          ? () => setState(() {
                              entry.value.dispose();
                              _lines.removeAt(entry.key);
                            })
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _cgstCtrl,
                          decoration: const InputDecoration(labelText: 'CGST %'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _sgstCtrl,
                          decoration: const InputDecoration(labelText: 'SGST %'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _igstCtrl,
                          decoration: const InputDecoration(labelText: 'IGST %'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _useOverride,
                    onChanged: (v) => setState(() => _useOverride = v ?? false),
                    title: const Text('Override taxable value'),
                    subtitle: Text('Line total: ${MoneyFormat.plain(_lineSum)}'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (_useOverride)
                    TextFormField(
                      controller: _overrideCtrl,
                      decoration: const InputDecoration(labelText: 'Taxable Value Override'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => setState(() {}),
                    ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total: ${MoneyFormat.plain(total)}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Save Sale'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LineItemRow extends ConsumerWidget {
  const _LineItemRow({required this.line, required this.onChanged, this.onRemove});
  final _LineRow line;
  final VoidCallback onChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(_productsProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: productsAsync.when(
              data: (products) => DropdownButtonFormField<ProductsTableData>(
                value: line.product,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Product', isDense: true),
                items: products
                    .map(
                      (p) => DropdownMenuItem(
                        value: p,
                        child: Text(p.productName, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  line.product = v;
                  final units = v?.units.split(',').where((u) => u.isNotEmpty).toList() ?? [];
                  if (units.isNotEmpty) line.unit = units.first;
                  onChanged();
                },
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              value: line.unit.isEmpty ? null : line.unit,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Unit', isDense: true),
              items: (line.product?.units.split(',').where((u) => u.isNotEmpty).toList() ?? [])
                  .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                  .toList(),
              onChanged: (v) {
                line.unit = v ?? '';
                onChanged();
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: TextField(
              controller: line.qtyCtrl,
              decoration: const InputDecoration(labelText: 'Qty', isDense: true),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (_) => onChanged(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: TextField(
              controller: line.priceCtrl,
              decoration: const InputDecoration(labelText: 'Price', isDense: true),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (_) => onChanged(),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Text(
              MoneyFormat.plain(line.taxable),
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: onRemove,
            color: onRemove == null ? Colors.transparent : AppColors.danger,
          ),
        ],
      ),
    );
  }
}

final _productsProvider = StreamProvider<List<ProductsTableData>>((ref) {
  return ref.watch(tradeRepositoryProvider).watchProducts();
});

class _SalesListTab extends ConsumerWidget {
  const _SalesListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesAsync = ref.watch(_salesProvider);
    return salesAsync.when(
      data: (sales) {
        if (sales.isEmpty) return const Center(child: Text('No sales recorded yet'));
        return Card(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: sales.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final row = sales[i];
              final sale = row.sale;
              return ListTile(
                title: Text('${sale.salesCode} — ${row.traderName}'),
                subtitle: Text(
                  '${sale.saleDate.year}-${sale.saleDate.month.toString().padLeft(2, '0')}-${sale.saleDate.day.toString().padLeft(2, '0')}'
                  '${sale.reversed ? ' • REVERSED' : ''}',
                  style: sale.reversed ? const TextStyle(color: AppColors.danger) : null,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      MoneyFormat.plain(sale.totalAfterTax),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      icon: const Icon(Icons.visibility_outlined, size: 18),
                      tooltip: 'View invoice',
                      onPressed: () => _viewOrShareInvoice(context, ref, sale, share: false),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share_outlined, size: 18),
                      tooltip: 'Share invoice',
                      onPressed: () => _viewOrShareInvoice(context, ref, sale, share: true),
                    ),
                    if (!sale.reversed)
                      IconButton(
                        icon: const Icon(Icons.undo, size: 18),
                        tooltip: 'Reverse sale',
                        onPressed: () => _confirmReverse(context, ref, sale.sid),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  Future<void> _confirmReverse(BuildContext context, WidgetRef ref, int salesId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reverse this sale?'),
        content: const Text(
          'Posts an equal-and-opposite journal entry to cancel its accounting effect.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Reverse'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(tradeRepositoryProvider).reverseSale(salesId);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _viewOrShareInvoice(
    BuildContext context,
    WidgetRef ref,
    SalesTableData sale, {
    required bool share,
  }) async {
    final repo = ref.read(tradeRepositoryProvider);
    final lines = await repo.getSaleLines(sale.sid);
    final trader = await repo.getTrader(sale.traderId);
    if (!context.mounted || trader == null) return;
    final bytes = await buildSaleInvoicePdf(sale: sale, trader: trader, lines: lines);
    if (share) {
      await Printing.sharePdf(bytes: bytes, filename: '${sale.salesCode}.pdf');
    } else {
      await Printing.layoutPdf(onLayout: (_) async => bytes, name: '${sale.salesCode}.pdf');
    }
  }
}

final _salesProvider = StreamProvider<List<({SalesTableData sale, String traderName})>>((ref) {
  return ref.watch(tradeRepositoryProvider).watchSales();
});
