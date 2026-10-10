import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';
import '../domain/karigar_models.dart';

/// Add/Edit Karigar — legacy add_karigar.php / fo-tr-edit-karigar.php
/// (documents/map.md Module 3).
class KarigarFormScreen extends ConsumerStatefulWidget {
  const KarigarFormScreen({super.key, this.karigarId});

  final int? karigarId;
  bool get isEdit => karigarId != null;

  @override
  ConsumerState<KarigarFormScreen> createState() => _KarigarFormScreenState();
}

class _KarigarFormScreenState extends ConsumerState<KarigarFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _aadharCtrl = TextEditingController();
  final _panCtrl = TextEditingController();
  final _bankNameCtrl = TextEditingController();
  final _bankAccountCtrl = TextEditingController();
  final _bankIfscCtrl = TextEditingController();
  final _openingCtrl = TextEditingController(text: '0');
  int? _workTypeId;
  BalanceType _balanceType = BalanceType.payable;
  bool _loading = false;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _load();
    } else {
      _ready = true;
    }
  }

  Future<void> _load() async {
    final k = await ref.read(karigarRepositoryProvider).getKarigar(widget.karigarId!);
    if (k == null || !mounted) return;
    _nameCtrl.text = k.karigarName;
    _mobileCtrl.text = k.mobile;
    _addressCtrl.text = k.address ?? '';
    _aadharCtrl.text = k.aadhar ?? '';
    _panCtrl.text = k.pan ?? '';
    _bankNameCtrl.text = k.bankName ?? '';
    _bankAccountCtrl.text = k.bankAccountNumber ?? '';
    _bankIfscCtrl.text = k.bankIfsc ?? '';
    _openingCtrl.text = k.openingBalance.toString();
    _workTypeId = k.workTypeId;
    _balanceType = BalanceType.fromValue(k.openingBalanceType);
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    for (final c in [
      _nameCtrl,
      _mobileCtrl,
      _addressCtrl,
      _aadharCtrl,
      _panCtrl,
      _bankNameCtrl,
      _bankAccountCtrl,
      _bankIfscCtrl,
      _openingCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _workTypeId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select a process')));
      return;
    }
    setState(() => _loading = true);
    try {
      final repo = ref.read(karigarRepositoryProvider);
      if (widget.isEdit) {
        await repo.updateKarigar(
          karigarId: widget.karigarId!,
          karigarName: _nameCtrl.text.trim(),
          mobile: _mobileCtrl.text.trim(),
          workTypeId: _workTypeId!,
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          aadhar: _aadharCtrl.text.trim().isEmpty ? null : _aadharCtrl.text.trim(),
          pan: _panCtrl.text.trim().isEmpty ? null : _panCtrl.text.trim(),
          bankName: _bankNameCtrl.text.trim().isEmpty ? null : _bankNameCtrl.text.trim(),
          bankAccountNumber: _bankAccountCtrl.text.trim().isEmpty ? null : _bankAccountCtrl.text.trim(),
          bankIfsc: _bankIfscCtrl.text.trim().isEmpty ? null : _bankIfscCtrl.text.trim(),
        );
      } else {
        await repo.addKarigar(
          karigarName: _nameCtrl.text.trim(),
          mobile: _mobileCtrl.text.trim(),
          workTypeId: _workTypeId!,
          openingBalance: double.tryParse(_openingCtrl.text.trim()) ?? 0,
          openingBalanceType: _balanceType,
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          aadhar: _aadharCtrl.text.trim().isEmpty ? null : _aadharCtrl.text.trim(),
          pan: _panCtrl.text.trim().isEmpty ? null : _panCtrl.text.trim(),
          bankName: _bankNameCtrl.text.trim().isEmpty ? null : _bankNameCtrl.text.trim(),
          bankAccountNumber: _bankAccountCtrl.text.trim().isEmpty ? null : _bankAccountCtrl.text.trim(),
          bankIfsc: _bankIfscCtrl.text.trim().isEmpty ? null : _bankIfscCtrl.text.trim(),
        );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Karigar ${widget.isEdit ? 'updated' : 'added'}')),
        );
        if (!widget.isEdit) {
          _formKey.currentState!.reset();
          setState(() => _balanceType = BalanceType.payable);
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

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const Center(child: CircularProgressIndicator());
    final workTypesAsync = ref.watch(_workTypesProvider);

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEdit ? 'Edit Karigar' : 'Add Karigar',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Karigar Name *'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _mobileCtrl,
                    decoration: const InputDecoration(labelText: 'Mobile Number *'),
                    keyboardType: TextInputType.phone,
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  workTypesAsync.when(
                    data: (types) => DropdownButtonFormField<int>(
                      value: _workTypeId,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Process *'),
                      items: types
                          .map((t) => DropdownMenuItem(value: t.id, child: Text(t.name)))
                          .toList(),
                      onChanged: (v) => setState(() => _workTypeId = v),
                    ),
                    loading: () => const LinearProgressIndicator(),
                    error: (e, _) => Text('Error: $e'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressCtrl,
                    decoration: const InputDecoration(labelText: 'Address'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _aadharCtrl,
                          decoration: const InputDecoration(labelText: 'Aadhar'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _panCtrl,
                          decoration: const InputDecoration(labelText: 'PAN'),
                        ),
                      ),
                    ],
                  ),
                  if (!widget.isEdit) ...[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _openingCtrl,
                            decoration: const InputDecoration(labelText: 'Opening Balance'),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<BalanceType>(
                            value: _balanceType,
                            isExpanded: true,
                            decoration: const InputDecoration(labelText: 'Balance Type'),
                            items: BalanceType.values
                                .map((t) => DropdownMenuItem(value: t, child: Text(t.value)))
                                .toList(),
                            onChanged: (v) => setState(() => _balanceType = v ?? BalanceType.payable),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 16),
                  Text('Bank Details', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _bankNameCtrl,
                          decoration: const InputDecoration(labelText: 'Bank Name'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _bankAccountCtrl,
                          decoration: const InputDecoration(labelText: 'Account Number'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _bankIfscCtrl,
                          decoration: const InputDecoration(labelText: 'IFSC'),
                        ),
                      ),
                    ],
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
                          : Text(widget.isEdit ? 'Save Changes' : 'Add Karigar'),
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

final _workTypesProvider = StreamProvider<List<WorkTypesTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchWorkTypes();
});
