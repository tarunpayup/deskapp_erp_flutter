import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/db/app_database.dart';
import '../domain/karigar_models.dart';

/// Add Job Work — legacy karigar_job_work.php (documents/map.md Module
/// 3): Single/Multi item toggle. Single-item Unit/Rate come strictly
/// from the rate card (rule #7) — picking a karigar+product with no rate
/// set blocks submission with a clear message instead of silently
/// failing.
class JobWorkFormScreen extends ConsumerStatefulWidget {
  const JobWorkFormScreen({super.key});

  @override
  ConsumerState<JobWorkFormScreen> createState() => _JobWorkFormScreenState();
}

class _JobWorkFormScreenState extends ConsumerState<JobWorkFormScreen> {
  bool _isMulti = false;
  int? _workTypeId;
  KarigarsTableData? _karigar;
  DateTime _date = DateTime.now();

  // Single-item state.
  KarigarProductsTableData? _singleProduct;
  final _weightCtrl = TextEditingController(text: '0');

  // Multi-item state.
  final List<_MultiLine> _lines = [_MultiLine()];
  bool _loading = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    for (final l in _lines) {
      l.dispose();
    }
    super.dispose();
  }

  Future<void> _submitSingle() async {
    if (_karigar == null || _singleProduct == null || _workTypeId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select process, karigar, and product')));
      return;
    }
    final weight = double.tryParse(_weightCtrl.text.trim()) ?? 0;
    setState(() => _loading = true);
    try {
      await ref.read(karigarRepositoryProvider).addSingleItemJobWork(
        workTypeId: _workTypeId!,
        karigarId: _karigar!.karigarId,
        productId: _singleProduct!.id,
        allotDate: _date,
        weight: weight,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job work allotted')));
        setState(() {
          _singleProduct = null;
          _weightCtrl.text = '0';
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _submitMulti() async {
    if (_karigar == null || _workTypeId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select process and karigar')));
      return;
    }
    if (_lines.any((l) => l.product == null || l.unit.isEmpty || l.qty <= 0)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Fill in every line, and set a rate for each')));
      return;
    }
    setState(() => _loading = true);
    try {
      final repo = ref.read(karigarRepositoryProvider);
      final lineInputs = <JobWorkLineItemInput>[];
      for (final l in _lines) {
        final rateRow = await repo.getRate(_karigar!.karigarId, l.product!.id, l.unit);
        if (rateRow == null) {
          throw KarigarRepositoryException(
            'No rate card exists for ${l.product!.productName} (${l.unit}) — set one up first',
          );
        }
        lineInputs.add(
          JobWorkLineItemInput(
            productId: l.product!.id,
            productName: l.product!.productName,
            unit: l.unit,
            rate: rateRow.rate,
            qtyAllotted: l.qty,
          ),
        );
      }
      await repo.addMultiItemJobWork(
        workTypeId: _workTypeId!,
        karigarId: _karigar!.karigarId,
        allotDate: _date,
        lines: lineInputs,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job work allotted')));
        setState(() {
          _lines
            ..forEach((l) => l.dispose())
            ..clear()
            ..add(_MultiLine());
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final workTypesAsync = ref.watch(_workTypesProvider);

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Job Work', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 16),
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: false, label: Text('Single Item')),
                    ButtonSegment(value: true, label: Text('Multi Item')),
                  ],
                  selected: {_isMulti},
                  onSelectionChanged: (s) => setState(() => _isMulti = s.first),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: workTypesAsync.when(
                        data: (types) => DropdownButtonFormField<int>(
                          value: _workTypeId,
                          isExpanded: true,
                          decoration: const InputDecoration(labelText: 'Process *'),
                          items: types
                              .map((t) => DropdownMenuItem(value: t.id, child: Text(t.name)))
                              .toList(),
                          onChanged: (v) => setState(() {
                            _workTypeId = v;
                            _karigar = null;
                          }),
                        ),
                        loading: () => const LinearProgressIndicator(),
                        error: (e, _) => Text('Error: $e'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _workTypeId == null
                          ? const InputDecorator(
                              decoration: InputDecoration(labelText: 'Karigar *'),
                              child: Text('Select a process first'),
                            )
                          : _KarigarPicker(
                              workTypeId: _workTypeId!,
                              value: _karigar,
                              onChanged: (k) => setState(() => _karigar = k),
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
                          decoration: const InputDecoration(labelText: 'Allot Date'),
                          child: Text(
                            '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (!_isMulti) ...[
                  _SingleItemFields(
                    workTypeId: _workTypeId,
                    product: _singleProduct,
                    onProductChanged: (p) => setState(() => _singleProduct = p),
                    weightCtrl: _weightCtrl,
                  ),
                ] else ...[
                  Row(
                    children: [
                      Text('Product Lines', style: Theme.of(context).textTheme.titleMedium),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () => setState(() => _lines.add(_MultiLine())),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Line'),
                      ),
                    ],
                  ),
                  ..._lines.asMap().entries.map(
                    (entry) => _MultiLineRow(
                      workTypeId: _workTypeId,
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
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : (_isMulti ? _submitMulti : _submitSingle),
                    child: _loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Allot Job Work'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _workTypesProvider = StreamProvider<List<WorkTypesTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchWorkTypes();
});

final _karigarProductsProvider =
    StreamProvider.family<List<KarigarProductsTableData>, int>((ref, workTypeId) {
      return ref.watch(karigarRepositoryProvider).watchKarigarProducts(workTypeId: workTypeId);
    });

class _KarigarPicker extends ConsumerWidget {
  const _KarigarPicker({required this.workTypeId, required this.value, required this.onChanged});
  final int workTypeId;
  final KarigarsTableData? value;
  final ValueChanged<KarigarsTableData?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final karigarsAsync = ref.watch(_karigarsForProcessProvider(workTypeId));
    return karigarsAsync.when(
      data: (karigars) => DropdownButtonFormField<KarigarsTableData>(
        value: karigars.any((k) => k.karigarId == value?.karigarId)
            ? karigars.firstWhere((k) => k.karigarId == value!.karigarId)
            : null,
        isExpanded: true,
        decoration: const InputDecoration(labelText: 'Karigar *'),
        items: karigars
            .map(
              (k) => DropdownMenuItem(
                value: k,
                child: Text(k.karigarName, overflow: TextOverflow.ellipsis),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

final _karigarsForProcessProvider =
    StreamProvider.family<List<KarigarsTableData>, int>((ref, workTypeId) {
      return ref
          .watch(karigarRepositoryProvider)
          .watchKarigars(status: 'Active')
          .map((list) => list.where((k) => k.workTypeId == workTypeId).toList());
    });

class _SingleItemFields extends ConsumerWidget {
  const _SingleItemFields({
    required this.workTypeId,
    required this.product,
    required this.onProductChanged,
    required this.weightCtrl,
  });
  final int? workTypeId;
  final KarigarProductsTableData? product;
  final ValueChanged<KarigarProductsTableData?> onProductChanged;
  final TextEditingController weightCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (workTypeId == null) {
      return const Text('Select a process to choose a product');
    }
    final productsAsync = ref.watch(_karigarProductsProvider(workTypeId!));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: productsAsync.when(
            data: (products) => DropdownButtonFormField<KarigarProductsTableData>(
              value: product,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Product *'),
              items: products
                  .map(
                    (p) => DropdownMenuItem(
                      value: p,
                      child: Text(p.productName, overflow: TextOverflow.ellipsis),
                    ),
                  )
                  .toList(),
              onChanged: onProductChanged,
            ),
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Text('Error: $e'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: weightCtrl,
            decoration: const InputDecoration(labelText: 'Weight *'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
      ],
    );
  }
}

class _MultiLine {
  KarigarProductsTableData? product;
  String unit = '';
  final qtyCtrl = TextEditingController(text: '0');

  double get qty => double.tryParse(qtyCtrl.text.trim()) ?? 0;

  void dispose() => qtyCtrl.dispose();
}

class _MultiLineRow extends ConsumerWidget {
  const _MultiLineRow({
    required this.workTypeId,
    required this.line,
    required this.onChanged,
    this.onRemove,
  });
  final int? workTypeId;
  final _MultiLine line;
  final VoidCallback onChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (workTypeId == null) return const SizedBox.shrink();
    final productsAsync = ref.watch(_karigarProductsProvider(workTypeId!));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: productsAsync.when(
              data: (products) => DropdownButtonFormField<KarigarProductsTableData>(
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
