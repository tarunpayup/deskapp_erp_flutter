import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';

/// Karigar product master, scoped to a process — legacy
/// fo-tr-add-product.php / fo-tr-edit-karigar-product.php /
/// fo-tr-view-karigar-products.php (documents/map.md Module 3).
class KarigarProductScreen extends ConsumerStatefulWidget {
  const KarigarProductScreen({super.key});

  @override
  ConsumerState<KarigarProductScreen> createState() => _KarigarProductScreenState();
}

class _KarigarProductScreenState extends ConsumerState<KarigarProductScreen> {
  int? _workTypeId;
  int? _editingPid;

  @override
  Widget build(BuildContext context) {
    final workTypesAsync = ref.watch(_workTypesProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Factory Products', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              workTypesAsync.when(
                data: (types) => Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: _workTypeId,
                        isExpanded: true,
                        decoration: const InputDecoration(labelText: 'Process'),
                        items: types
                            .map((t) => DropdownMenuItem(value: t.id, child: Text(t.name)))
                            .toList(),
                        onChanged: (v) => setState(() => _workTypeId = v),
                      ),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: _workTypeId == null ? null : () => setState(() => _editingPid = -1),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Product'),
                    ),
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Card(
                  child: _workTypeId == null
                      ? const Center(child: Text('Select a process to view its products'))
                      : _ProductList(
                          workTypeId: _workTypeId!,
                          onEdit: (pid) => setState(() => _editingPid = pid),
                        ),
                ),
              ),
            ],
          ),
        ),
        if (_editingPid != null && _workTypeId != null) ...[
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: _ProductForm(
              workTypeId: _workTypeId!,
              pid: _editingPid == -1 ? null : _editingPid,
              onDone: () => setState(() => _editingPid = null),
            ),
          ),
        ],
      ],
    );
  }
}

final _workTypesProvider = StreamProvider<List<WorkTypesTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchWorkTypes();
});

final _productsProvider = StreamProvider.family<List<KarigarProductsTableData>, int>((ref, workTypeId) {
  return ref.watch(karigarRepositoryProvider).watchKarigarProducts(workTypeId: workTypeId);
});

class _ProductList extends ConsumerWidget {
  const _ProductList({required this.workTypeId, required this.onEdit});
  final int workTypeId;
  final ValueChanged<int> onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(_productsProvider(workTypeId));
    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) return const Center(child: Text('No products in this process yet'));
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final p = products[i];
            return ListTile(
              onTap: () => onEdit(p.id),
              title: Text(p.productName),
              subtitle: Text(p.units),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

class _ProductForm extends ConsumerStatefulWidget {
  const _ProductForm({required this.workTypeId, required this.pid, required this.onDone});
  final int workTypeId;
  final int? pid;
  final VoidCallback onDone;

  @override
  ConsumerState<_ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<_ProductForm> {
  final _nameCtrl = TextEditingController();
  final Set<String> _units = {};
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    if (widget.pid != null) {
      _load();
    } else {
      _ready = true;
    }
  }

  Future<void> _load() async {
    final p = await ref.read(karigarRepositoryProvider).getKarigarProduct(widget.pid!);
    if (p == null || !mounted) return;
    _nameCtrl.text = p.productName;
    _units.addAll(p.units.split(',').where((u) => u.isNotEmpty));
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_nameCtrl.text.trim().isEmpty || _units.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a name and select at least one unit')),
      );
      return;
    }
    final repo = ref.read(karigarRepositoryProvider);
    if (widget.pid != null) {
      await repo.updateKarigarProduct(
        id: widget.pid!,
        productName: _nameCtrl.text.trim(),
        units: _units.toList(),
      );
    } else {
      await repo.addKarigarProduct(
        workTypeId: widget.workTypeId,
        productName: _nameCtrl.text.trim(),
        units: _units.toList(),
      );
    }
    widget.onDone();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const Center(child: CircularProgressIndicator());
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.pid != null ? 'Edit Product' : 'Add Product',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(onPressed: widget.onDone, icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Product Name *'),
            ),
            const SizedBox(height: 16),
            Text('Units *', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tradeUnits.map((u) {
                final selected = _units.contains(u);
                return FilterChip(
                  label: Text(u),
                  selected: selected,
                  onSelected: (v) => setState(() => v ? _units.add(u) : _units.remove(u)),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: _submit, child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
