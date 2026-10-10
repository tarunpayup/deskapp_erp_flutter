import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/db/app_database.dart';

/// Product master — legacy o-tr-product.php / o-tr-product-edit.php
/// (documents/map.md Module 5). Combines list + add/edit into one screen
/// (a side panel form, like the legacy's modal-based add/edit) since the
/// form is short. Units are a multi-select from the one canonical
/// [tradeUnits] list (map.md flags the legacy's two inconsistent unit
/// lists — reconciled here).
class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  String _search = '';
  int? _editingPid;

  void _openForm([int? pid]) {
    setState(() => _editingPid = pid ?? -1);
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(_productsProvider(_search));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Products', style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  FilledButton.icon(
                    onPressed: () => _openForm(),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Product'),
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
                  child: productsAsync.when(
                    data: (products) => products.isEmpty
                        ? const Center(child: Text('No products found'))
                        : ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: products.length,
                            separatorBuilder: (_, __) => const Divider(height: 1),
                            itemBuilder: (context, i) {
                              final p = products[i];
                              return ListTile(
                                onTap: () => _openForm(p.pid),
                                title: Text(
                                  p.productName,
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  '${p.productCode} • ${p.units} • ${p.transactionType}',
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('₹${p.basePrice.toStringAsFixed(2)}'),
                                    const SizedBox(width: 16),
                                    Switch(
                                      value: p.status == 'Active',
                                      onChanged: (_) => ref
                                          .read(tradeRepositoryProvider)
                                          .toggleProductStatus(p.pid),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      color: AppColors.danger,
                                      onPressed: () => _confirmDelete(context, p.pid),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_editingPid != null) ...[
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: _ProductForm(
              pid: _editingPid == -1 ? null : _editingPid,
              onDone: () => setState(() => _editingPid = null),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context, int pid) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete product?'),
        content: const Text('This cannot be undone.'),
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
      await ref.read(tradeRepositoryProvider).deleteProduct(pid);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

final _productsProvider = StreamProvider.family<List<ProductsTableData>, String>((ref, search) {
  return ref.watch(tradeRepositoryProvider).watchProducts(search: search);
});

class _ProductForm extends ConsumerStatefulWidget {
  const _ProductForm({required this.pid, required this.onDone});
  final int? pid;
  final VoidCallback onDone;

  @override
  ConsumerState<_ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<_ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _priceCtrl = TextEditingController(text: '0');
  final Set<String> _units = {};
  String _transactionType = 'Both';
  bool _loading = false;
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
    final p = await ref.read(tradeRepositoryProvider).getProduct(widget.pid!);
    if (p == null || !mounted) return;
    _nameCtrl.text = p.productName;
    _priceCtrl.text = p.basePrice.toString();
    _units.addAll(p.units.split(',').where((u) => u.isNotEmpty));
    _transactionType = p.transactionType;
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_units.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select at least one unit')),
      );
      return;
    }
    setState(() => _loading = true);
    try {
      final repo = ref.read(tradeRepositoryProvider);
      if (widget.pid != null) {
        await repo.updateProduct(
          pid: widget.pid!,
          productName: _nameCtrl.text.trim(),
          basePrice: double.tryParse(_priceCtrl.text.trim()) ?? 0,
          units: _units.toList(),
          transactionType: _transactionType,
        );
      } else {
        await repo.addProduct(
          productName: _nameCtrl.text.trim(),
          basePrice: double.tryParse(_priceCtrl.text.trim()) ?? 0,
          units: _units.toList(),
          transactionType: _transactionType,
        );
      }
      widget.onDone();
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
    if (!_ready) return const Center(child: CircularProgressIndicator());
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(labelText: 'Product Name *'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceCtrl,
                  decoration: const InputDecoration(labelText: 'Base Price'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _transactionType,
                  isExpanded: true,
                  decoration: const InputDecoration(labelText: 'Transaction Type'),
                  items: const ['Buy', 'Sale', 'Both']
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (v) => setState(() => _transactionType = v ?? 'Both'),
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
                  child: FilledButton(
                    onPressed: _loading ? null : _submit,
                    child: _loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save'),
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
