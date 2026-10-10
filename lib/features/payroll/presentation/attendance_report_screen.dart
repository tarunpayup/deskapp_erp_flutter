import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/payroll_models.dart';

/// Attendance report — legacy attendance-report.php /
/// function_attendance_report.php (documents/map.md Module 2): per-
/// employee month tally (Present-equivalent/Absent/Half) plus the same
/// salary formula used by Payroll, so the two screens never disagree.
class AttendanceReportScreen extends ConsumerStatefulWidget {
  const AttendanceReportScreen({super.key});

  @override
  ConsumerState<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
}

class _AttendanceReportScreenState extends ConsumerState<AttendanceReportScreen> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(_employeesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Attendance Report', style: Theme.of(context).textTheme.headlineMedium),
            const Spacer(),
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
          child: employeesAsync.when(
            data: (employees) {
              if (employees.isEmpty) return const Center(child: Text('No employees found'));
              return Card(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: employees.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) => _ReportRow(employee: employees[i], month: _month),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

final _employeesProvider = StreamProvider<List<EmployeesTableData>>((ref) {
  return ref.watch(payrollRepositoryProvider).watchEmployees();
});

class _ReportRow extends ConsumerWidget {
  const _ReportRow({required this.employee, required this.month});
  final EmployeesTableData employee;
  final DateTime month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tallyAsync = ref.watch(
      _tallyProvider((employeeId: employee.employeeId, year: month.year, month: month.month)),
    );
    return tallyAsync.when(
      data: (tally) {
        final credited = SalaryCalculator.computeCredited(
          salaryType: SalaryType.fromValue(employee.salaryType),
          salary: employee.salary,
          tally: tally,
        );
        return ListTile(
          title: Text(employee.employeeName, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(
            '${employee.employeeCode} • Present: ${tally.presentEquivalent.toStringAsFixed(1)}'
            ' / ${tally.workingDaysTillToday} • Absent: ${tally.absentDays} • Half: ${tally.halfDays}',
          ),
          trailing: Text(
            MoneyFormat.plain(credited),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        );
      },
      loading: () => const ListTile(title: Text('Loading...')),
      error: (e, _) => ListTile(title: Text('Error: $e')),
    );
  }
}

typedef _TallyKey = ({int employeeId, int year, int month});

final _tallyProvider = FutureProvider.family<AttendanceTally, _TallyKey>((ref, key) {
  return ref.watch(payrollRepositoryProvider).getMonthTally(key.employeeId, key.year, key.month);
});
