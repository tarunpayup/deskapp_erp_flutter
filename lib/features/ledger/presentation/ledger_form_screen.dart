import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../domain/ledger_models.dart';

/// Add/Edit Ledger form — legacy o-t-ledger-add.php/o-t-ledger-edit.php
/// (documents/map.md Module 4), unified into one widget parameterized by
/// `lid` (null = add mode), since the legacy pair were near-duplicate
/// markup. Fixes two legacy bugs along the way (see map.md): the mislabeled
/// "Expense" optgroup (already fixed in account_types.dart) and the
/// edit-mode uniqueness check not excluding the current row (fixed in
/// LedgerRepository.isAccountCodeTaken's excludeLid param).
class LedgerFormScreen extends ConsumerStatefulWidget {
  const LedgerFormScreen({super.key, this.lid});
  final int? lid;

  @override
  ConsumerState<LedgerFormScreen> createState() => _LedgerFormScreenState();
}

class _LedgerFormScreenState extends ConsumerState<LedgerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _openingCtrl = TextEditingController(text: '0');
  final _descriptionCtrl = TextEditingController();

  String? _accountType;
  DrCr _dc = DrCr.debit;
  bool _loading = false;
  bool _codeTaken = false;
  bool _loadedExisting = false;

  bool get _isEdit => widget.lid != null;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _codeCtrl.dispose();
    _openingCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadExisting() async {
    final ledger = await ref.read(ledgerRepositoryProvider).getLedger(widget.lid!);
    if (ledger == null || !mounted) return;
    setState(() {
      _nameCtrl.text = ledger.accountName;
      _codeCtrl.text = ledger.accountCode;
      _accountType = ledger.accountType;
      _dc = DrCr.fromCode(ledger.dc);
      _openingCtrl.text = ledger.openingBalance.abs().toStringAsFixed(2);
      _descriptionCtrl.text = ledger.description ?? '';
      _loadedExisting = true;
    });
  }

  Future<void> _checkCode() async {
    final code = _codeCtrl.text.trim();
    if (code.isEmpty) {
      setState(() => _codeTaken = false);
      return;
    }
    final taken = await ref
        .read(ledgerRepositoryProvider)
        .isAccountCodeTaken(code, excludeLid: widget.lid);
    if (mounted) setState(() => _codeTaken = taken);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _accountType == null) return;
    if (_codeTaken) return;

    setState(() => _loading = true);
    final repo = ref.read(ledgerRepositoryProvider);
    final opening = double.tryParse(_openingCtrl.text.trim()) ?? 0;

    try {
      if (_isEdit) {
        await repo.updateLedger(
          lid: widget.lid!,
          accountType: _accountType!,
          accountName: _nameCtrl.text.trim(),
          accountCode: _codeCtrl.text.trim(),
          openingBalance: opening,
          openingDc: _dc,
          description: _descriptionCtrl.text.trim(),
        );
      } else {
        await repo.addLedger(
          accountType: _accountType!,
          accountName: _nameCtrl.text.trim(),
          accountCode: _codeCtrl.text.trim(),
          openingBalance: opening,
          openingDc: _dc,
          description: _descriptionCtrl.text.trim(),
        );
      }
      if (mounted) context.go('/office/ledger/manage');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isEdit && !_loadedExisting) {
      _loadExisting();
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
                    _isEdit ? 'Edit Ledger' : 'Add Ledger',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: _accountType,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Account Type *'),
                    items: [
                      for (final group in accountTypeGroups)
                        ...[
                          DropdownMenuItem(
                            enabled: false,
                            value: '__group_${group.label}',
                            child: Text(
                              group.label,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...group.types.map(
                            (t) => DropdownMenuItem(value: t, child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(t, overflow: TextOverflow.ellipsis),
                            )),
                          ),
                        ],
                    ],
                    onChanged: (v) {
                      if (v == null || v.startsWith('__group_')) return;
                      setState(() => _accountType = v);
                    },
                    validator: (v) => v == null ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Account Name *'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _codeCtrl,
                    decoration: InputDecoration(
                      labelText: 'Account Code',
                      errorText: _codeTaken ? 'This code is already in use' : null,
                    ),
                    onChanged: (_) => _checkCode(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _openingCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Opening Balance',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<DrCr>(
                          value: _dc,
                          decoration: const InputDecoration(
                            labelText: 'Transaction Code',
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: DrCr.debit,
                              child: Text('Debit (Dr)'),
                            ),
                            DropdownMenuItem(
                              value: DrCr.credit,
                              child: Text('Credit (Cr)'),
                            ),
                          ],
                          onChanged: (v) => setState(() => _dc = v ?? DrCr.debit),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionCtrl,
                    decoration: const InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => context.go('/office/ledger/manage'),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 12),
                      FilledButton(
                        onPressed: _loading ? null : _submit,
                        child: _loading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(_isEdit ? 'Save Changes' : 'Save Ledger'),
                      ),
                    ],
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
