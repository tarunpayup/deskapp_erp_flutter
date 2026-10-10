import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../../../data/db/app_database.dart';

/// Employee list — legacy employee-list.php (documents/map.md Module 2).
/// Lists ALL employees (status filter optional, matching the legacy's
/// "not status-filtered by default" behavior) with an inline Active/Not
/// Active toggle — implemented as a real state-changing action here
/// rather than the legacy's non-idempotent GET-with-side-effects.
class EmployeeListScreen extends ConsumerStatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  ConsumerState<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends ConsumerState<EmployeeListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(_employeesProvider(_search));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Employees', style: Theme.of(context).textTheme.headlineMedium),
            ),
            FilledButton.icon(
              onPressed: () => context.go('/office/employees/add'),
              icon: const Icon(Icons.add),
              label: const Text('Add Employee'),
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
            child: employeesAsync.when(
              data: (employees) {
                if (employees.isEmpty) {
                  return const Center(child: Text('No employees found'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: employees.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final e = employees[i];
                    return ListTile(
                      onTap: () => context.go('/office/employees/edit/${e.employeeId}'),
                      title: Text(e.employeeName, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(
                        '${e.employeeCode}'
                        '${e.designation != null && e.designation!.isNotEmpty ? ' • ${e.designation}' : ''}'
                        ' • ${e.salaryType} ₹${e.salary.toStringAsFixed(0)}',
                      ),
                      trailing: Switch(
                        value: e.status == 'Active',
                        onChanged: (_) =>
                            ref.read(payrollRepositoryProvider).toggleEmployeeStatus(e.employeeId),
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
}

final _employeesProvider = StreamProvider.family<List<EmployeesTableData>, String>((ref, search) {
  return ref.watch(payrollRepositoryProvider).watchEmployees(search: search);
});
