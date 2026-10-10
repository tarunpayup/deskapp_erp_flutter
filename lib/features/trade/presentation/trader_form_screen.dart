import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../domain/trade_models.dart';

/// Add/Edit Customer or Vendor — legacy o-tr-customer.php / o-tr-vendor.php
/// / o-tr-trader-edit.php (documents/map.md Module 5), unified into one
/// form parameterized by [type] instead of two near-duplicate files.
class TraderFormScreen extends ConsumerStatefulWidget {
  const TraderFormScreen({super.key, required this.type, this.traderId});

  final TraderType type;
  final int? traderId;

  bool get isEdit => traderId != null;

  @override
  ConsumerState<TraderFormScreen> createState() => _TraderFormScreenState();
}

class _TraderFormScreenState extends ConsumerState<TraderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _gstinCtrl = TextEditingController();
  final _panCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _telephoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _stateCtrl = TextEditingController();
  final _pincodeCtrl = TextEditingController();
  final _openingCtrl = TextEditingController(text: '0');
  bool _loading = false;
  bool _loadedExisting = false;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) _loadExisting();
  }

  Future<void> _loadExisting() async {
    final trader = await ref.read(tradeRepositoryProvider).getTrader(widget.traderId!);
    if (trader == null || !mounted) return;
    _nameCtrl.text = trader.traderName;
    _gstinCtrl.text = trader.gstin ?? '';
    _panCtrl.text = trader.panCard ?? '';
    _phoneCtrl.text = trader.phone ?? '';
    _telephoneCtrl.text = trader.telephone ?? '';
    _emailCtrl.text = trader.email ?? '';
    _addressCtrl.text = trader.address ?? '';
    _cityCtrl.text = trader.city ?? '';
    _stateCtrl.text = trader.state ?? '';
    _pincodeCtrl.text = trader.pincode ?? '';
    setState(() => _loadedExisting = true);
  }

  @override
  void dispose() {
    for (final c in [
      _nameCtrl,
      _gstinCtrl,
      _panCtrl,
      _phoneCtrl,
      _telephoneCtrl,
      _emailCtrl,
      _addressCtrl,
      _cityCtrl,
      _stateCtrl,
      _pincodeCtrl,
      _openingCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final repo = ref.read(tradeRepositoryProvider);
      if (widget.isEdit) {
        await repo.updateTrader(
          id: widget.traderId!,
          traderName: _nameCtrl.text.trim(),
          gstin: _gstinCtrl.text.trim().isEmpty ? null : _gstinCtrl.text.trim(),
          panCard: _panCtrl.text.trim().isEmpty ? null : _panCtrl.text.trim(),
          phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
          telephone: _telephoneCtrl.text.trim().isEmpty ? null : _telephoneCtrl.text.trim(),
          email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          city: _cityCtrl.text.trim().isEmpty ? null : _cityCtrl.text.trim(),
          state: _stateCtrl.text.trim().isEmpty ? null : _stateCtrl.text.trim(),
          pincode: _pincodeCtrl.text.trim().isEmpty ? null : _pincodeCtrl.text.trim(),
        );
      } else {
        await repo.addTrader(
          type: widget.type,
          traderName: _nameCtrl.text.trim(),
          openingBalance: double.tryParse(_openingCtrl.text.trim()) ?? 0,
          gstin: _gstinCtrl.text.trim().isEmpty ? null : _gstinCtrl.text.trim(),
          panCard: _panCtrl.text.trim().isEmpty ? null : _panCtrl.text.trim(),
          phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
          telephone: _telephoneCtrl.text.trim().isEmpty ? null : _telephoneCtrl.text.trim(),
          email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          city: _cityCtrl.text.trim().isEmpty ? null : _cityCtrl.text.trim(),
          state: _stateCtrl.text.trim().isEmpty ? null : _stateCtrl.text.trim(),
          pincode: _pincodeCtrl.text.trim().isEmpty ? null : _pincodeCtrl.text.trim(),
        );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.type.label} ${widget.isEdit ? 'updated' : 'added'}')),
        );
        if (!widget.isEdit) _formKey.currentState!.reset();
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
    if (widget.isEdit && !_loadedExisting) {
      return const Center(child: CircularProgressIndicator());
    }
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
                    widget.isEdit ? 'Edit ${widget.type.label}' : 'Add ${widget.type.label}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: InputDecoration(labelText: '${widget.type.label} Name *'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _gstinCtrl,
                          decoration: const InputDecoration(labelText: 'GSTIN'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _panCtrl,
                          decoration: const InputDecoration(labelText: 'PAN Card'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _phoneCtrl,
                          decoration: const InputDecoration(labelText: 'Phone'),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _telephoneCtrl,
                          decoration: const InputDecoration(labelText: 'Telephone'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
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
                          controller: _cityCtrl,
                          decoration: const InputDecoration(labelText: 'City'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _stateCtrl,
                          decoration: const InputDecoration(labelText: 'State'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _pincodeCtrl,
                          decoration: const InputDecoration(labelText: 'Pincode'),
                        ),
                      ),
                    ],
                  ),
                  if (!widget.isEdit) ...[
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _openingCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Opening Balance',
                        helperText: 'Positive = owes us (Dr), negative = we owe them (Cr)',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                    ),
                  ],
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
                          : Text(widget.isEdit ? 'Save Changes' : 'Add ${widget.type.label}'),
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
