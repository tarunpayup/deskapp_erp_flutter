import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Per-employee payroll — legacy payroll.php / function_payroll.php
/// (documents/map.md Module 2): summary cards (Credited/Paid/Balance for
/// the selected month, plus lifetime "Current balance"), add/delete
/// payments. Payment amounts are positive integers (legacy rule).
class PayrollScreen extends ConsumerStatefulWidget {
  const PayrollScreen({super.key});

  @override
  ConsumerState<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends ConsumerState<PayrollScreen> {
  EmployeesTableData? _employee;
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(_employeesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payroll', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: employeesAsync.when(
                data: (employees) => DropdownButtonFormField<EmployeesTableData>(
                  value: employees.any((e) => e.employeeId == _employee?.employeeId)
                      ? employees.firstWhere((e) => e.employeeId == _employee!.employeeId)
                      : null,
                  isExpanded: true,
                  decoration: const InputDecoration(labelText: 'Employee'),
                  items: employees
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text('${e.employeeName} (${e.employeeCode})',
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _employee = v),
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _month,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() => _month = DateTime(picked.year, picked.month));
                }
              },
              icon: const Icon(Icons.calendar_month_outlined, size: 18),
              label: Text('${_month.year}-${_month.month.toString().padLeft(2, '0')}'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _employee == null
              ? const Center(child: Text('Select an employee'))
              : _PayrollDetail(employee: _employee!, month: _month),
        ),
      ],
    );
  }
}

final _employeesProvider = StreamProvider<List<EmployeesTableData>>((ref) {
  return ref.watch(payrollRepositoryProvider).watchEmployees();
});

class _PayrollDetail extends ConsumerWidget {
  const _PayrollDetail({required this.employee, required this.month});
  final EmployeesTableData employee;
  final DateTime month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(_monthBalanceProvider((employee: employee, month: month)));
    final lifetimeAsync = ref.watch(_lifetimeBalanceProvider(employee));
    final paymentsAsync = ref.watch(_paymentsProvider(employee.employeeId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                label: '${month.year}-${month.month.toString().padLeft(2, '0')} Balance',
                value: balanceAsync.when(
                  data: (v) => MoneyFormat.plain(v),
                  loading: () => '...',
                  error: (_, __) => 'Error',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _SummaryCard(
                label: 'Current Balance (lifetime)',
                value: lifetimeAsync.when(
                  data: (v) => MoneyFormat.plain(v),
                  loading: () => '...',
                  error: (_, __) => 'Error',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton.icon(
                onPressed: () => _addPaymentDialog(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Add Payment'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: paymentsAsync.when(
              data: (payments) {
                if (payments.isEmpty) {
                  return const Center(child: Text('No payments recorded yet'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: payments.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final p = payments[i];
                    return ListTile(
                      title: Text('₹${p.amount}'),
                      subtitle: Text(
                        '${p.paymentDate.year}-${p.paymentDate.month.toString().padLeft(2, '0')}-${p.paymentDate.day.toString().padLeft(2, '0')}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: AppColors.danger,
                        onPressed: () async {
                          await ref.read(payrollRepositoryProvider).deletePayment(p.paymentId);
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _addPaymentDialog(BuildContext context, WidgetRef ref) async {
    final amountCtrl = TextEditingController();
    var date = DateTime.now();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountCtrl,
                decoration: const InputDecoration(labelText: 'Amount (₹, whole number)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => date = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Payment Date'),
                  child: Text(
                    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Save')),
          ],
        ),
      ),
    );
    if (result != true) return;
    final amount = int.tryParse(amountCtrl.text.trim());
    if (amount == null || amount <= 0) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter a valid whole-number amount')),
        );
      }
      return;
    }
    try {
      await ref.read(payrollRepositoryProvider).addPayment(
        employeeId: employee.employeeId,
        paymentDate: date,
        amount: amount,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

typedef _MonthKey = ({EmployeesTableData employee, DateTime month});

final _monthBalanceProvider = FutureProvider.family<double, _MonthKey>((ref, key) {
  return ref
      .watch(payrollRepositoryProvider)
      .getMonthBalance(key.employee, key.month.year, key.month.month);
});

final _lifetimeBalanceProvider = FutureProvider.family<double, EmployeesTableData>((ref, employee) {
  return ref.watch(payrollRepositoryProvider).getLifetimeBalance(employee);
});

final _paymentsProvider = StreamProvider.family<List<EmployeePaymentsTableData>, int>((ref, id) {
  return ref.watch(payrollRepositoryProvider).watchPayments(id);
});

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
