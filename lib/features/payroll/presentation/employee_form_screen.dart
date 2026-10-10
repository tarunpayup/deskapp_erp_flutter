import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../domain/payroll_models.dart';

/// Add/Edit Employee — legacy add-employee.php / edit-employee.php
/// (documents/map.md Module 2).
class EmployeeFormScreen extends ConsumerStatefulWidget {
  const EmployeeFormScreen({super.key, this.employeeId});

  final int? employeeId;
  bool get isEdit => employeeId != null;

  @override
  ConsumerState<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends ConsumerState<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _fatherNameCtrl = TextEditingController();
  final _mobCtrl = TextEditingController();
  final _altMobCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _designationCtrl = TextEditingController();
  final _departmentCtrl = TextEditingController();
  final _salaryCtrl = TextEditingController(text: '0');
  final _bankNameCtrl = TextEditingController();
  final _bankAccountCtrl = TextEditingController();
  final _bankIfscCtrl = TextEditingController();
  DateTime _dateOfJoining = DateTime.now();
  SalaryType _salaryType = SalaryType.monthly;
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
    final e = await ref.read(payrollRepositoryProvider).getEmployee(widget.employeeId!);
    if (e == null || !mounted) return;
    _nameCtrl.text = e.employeeName;
    _fatherNameCtrl.text = e.fatherName ?? '';
    _mobCtrl.text = e.mobNo;
    _altMobCtrl.text = e.alternateMobNo ?? '';
    _emailCtrl.text = e.email ?? '';
    _addressCtrl.text = e.address ?? '';
    _designationCtrl.text = e.designation ?? '';
    _departmentCtrl.text = e.department ?? '';
    _salaryCtrl.text = e.salary.toString();
    _bankNameCtrl.text = e.bankName ?? '';
    _bankAccountCtrl.text = e.bankAccountNumber ?? '';
    _bankIfscCtrl.text = e.bankIfsc ?? '';
    _dateOfJoining = e.dateOfJoining;
    _salaryType = SalaryType.fromValue(e.salaryType);
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    for (final c in [
      _nameCtrl,
      _fatherNameCtrl,
      _mobCtrl,
      _altMobCtrl,
      _emailCtrl,
      _addressCtrl,
      _designationCtrl,
      _departmentCtrl,
      _salaryCtrl,
      _bankNameCtrl,
      _bankAccountCtrl,
      _bankIfscCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final repo = ref.read(payrollRepositoryProvider);
      if (widget.isEdit) {
        await repo.updateEmployee(
          employeeId: widget.employeeId!,
          employeeName: _nameCtrl.text.trim(),
          mobNo: _mobCtrl.text.trim(),
          dateOfJoining: _dateOfJoining,
          salary: double.tryParse(_salaryCtrl.text.trim()) ?? 0,
          salaryType: _salaryType,
          fatherName: _fatherNameCtrl.text.trim().isEmpty ? null : _fatherNameCtrl.text.trim(),
          alternateMobNo: _altMobCtrl.text.trim().isEmpty ? null : _altMobCtrl.text.trim(),
          email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          designation: _designationCtrl.text.trim().isEmpty ? null : _designationCtrl.text.trim(),
          department: _departmentCtrl.text.trim().isEmpty ? null : _departmentCtrl.text.trim(),
          bankName: _bankNameCtrl.text.trim().isEmpty ? null : _bankNameCtrl.text.trim(),
          bankAccountNumber: _bankAccountCtrl.text.trim().isEmpty ? null : _bankAccountCtrl.text.trim(),
          bankIfsc: _bankIfscCtrl.text.trim().isEmpty ? null : _bankIfscCtrl.text.trim(),
        );
      } else {
        await repo.addEmployee(
          employeeName: _nameCtrl.text.trim(),
          mobNo: _mobCtrl.text.trim(),
          dateOfJoining: _dateOfJoining,
          salary: double.tryParse(_salaryCtrl.text.trim()) ?? 0,
          salaryType: _salaryType,
          fatherName: _fatherNameCtrl.text.trim().isEmpty ? null : _fatherNameCtrl.text.trim(),
          alternateMobNo: _altMobCtrl.text.trim().isEmpty ? null : _altMobCtrl.text.trim(),
          email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
          address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
          designation: _designationCtrl.text.trim().isEmpty ? null : _designationCtrl.text.trim(),
          department: _departmentCtrl.text.trim().isEmpty ? null : _departmentCtrl.text.trim(),
          bankName: _bankNameCtrl.text.trim().isEmpty ? null : _bankNameCtrl.text.trim(),
          bankAccountNumber: _bankAccountCtrl.text.trim().isEmpty ? null : _bankAccountCtrl.text.trim(),
          bankIfsc: _bankIfscCtrl.text.trim().isEmpty ? null : _bankIfscCtrl.text.trim(),
        );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Employee ${widget.isEdit ? 'updated' : 'added'}')),
        );
        if (!widget.isEdit) {
          _formKey.currentState!.reset();
          setState(() {
            _salaryType = SalaryType.monthly;
            _dateOfJoining = DateTime.now();
          });
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
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEdit ? 'Edit Employee' : 'Add Employee',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(labelText: 'Employee Name *'),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _fatherNameCtrl,
                          decoration: const InputDecoration(labelText: "Father's Name"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _mobCtrl,
                          decoration: const InputDecoration(labelText: 'Mobile Number *'),
                          keyboardType: TextInputType.phone,
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _altMobCtrl,
                          decoration: const InputDecoration(labelText: 'Alternate Mobile'),
                          keyboardType: TextInputType.phone,
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
                          controller: _designationCtrl,
                          decoration: const InputDecoration(labelText: 'Designation'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _departmentCtrl,
                          decoration: const InputDecoration(labelText: 'Department'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _dateOfJoining,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) setState(() => _dateOfJoining = picked);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(labelText: 'Date of Joining'),
                            child: Text(
                              '${_dateOfJoining.year}-${_dateOfJoining.month.toString().padLeft(2, '0')}-${_dateOfJoining.day.toString().padLeft(2, '0')}',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _salaryCtrl,
                          decoration: const InputDecoration(labelText: 'Salary *'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Required' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<SalaryType>(
                          value: _salaryType,
                          isExpanded: true,
                          decoration: const InputDecoration(labelText: 'Salary Type'),
                          items: SalaryType.values
                              .map((t) => DropdownMenuItem(value: t, child: Text(t.value)))
                              .toList(),
                          onChanged: (v) => setState(() => _salaryType = v ?? SalaryType.monthly),
                        ),
                      ),
                    ],
                  ),
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
                          : Text(widget.isEdit ? 'Save Changes' : 'Add Employee'),
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
