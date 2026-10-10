import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/db/app_database.dart';
import '../domain/payroll_models.dart';

/// Daily attendance marking — legacy attendance.php (documents/map.md
/// Module 2): Active employees only, cannot mark future dates, "Mark All
/// Present" bulk action. P/A/H chips per row instead of the legacy's
/// dropdown-per-row.
class AttendanceScreen extends ConsumerStatefulWidget {
  const AttendanceScreen({super.key});

  @override
  ConsumerState<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen> {
  DateTime _date = DateTime.now();

  bool get _isFuture {
    final today = DateTime.now();
    return _date.isAfter(DateTime(today.year, today.month, today.day));
  }

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(_activeEmployeesProvider);
    final attendanceAsync = ref.watch(_attendanceProvider(_date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Attendance', style: Theme.of(context).textTheme.headlineMedium),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => _date = picked);
              },
              icon: const Icon(Icons.calendar_today_outlined, size: 18),
              label: Text(
                '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}',
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: () async {
                await ref.read(payrollRepositoryProvider).markAllPresent(_date);
                ref.invalidate(_attendanceProvider(_date));
              },
              icon: const Icon(Icons.done_all),
              label: const Text('Mark All Present'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: employeesAsync.when(
            data: (employees) => attendanceAsync.when(
              data: (attendance) {
                if (employees.isEmpty) {
                  return const Center(child: Text('No active employees'));
                }
                return Card(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: employees.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, i) {
                      final e = employees[i];
                      return _AttendanceRow(
                        employee: e,
                        date: _date,
                        status: attendance[e.employeeId],
                        locked: _isFuture,
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

final _activeEmployeesProvider = StreamProvider<List<EmployeesTableData>>((ref) {
  return ref.watch(payrollRepositoryProvider).watchEmployees(status: 'Active');
});

final _attendanceProvider = FutureProvider.family<Map<int, AttendanceStatus>, DateTime>(
  (ref, date) => ref.watch(payrollRepositoryProvider).getAttendanceForDate(date),
);

class _AttendanceRow extends ConsumerWidget {
  const _AttendanceRow({
    required this.employee,
    required this.date,
    required this.status,
    required this.locked,
  });

  final EmployeesTableData employee;
  final DateTime date;
  final AttendanceStatus? status;
  final bool locked;

  Future<void> _set(WidgetRef ref, AttendanceStatus? next) async {
    await ref.read(payrollRepositoryProvider).setAttendance(
      employeeId: employee.employeeId,
      date: date,
      status: next,
    );
    ref.invalidate(_attendanceProvider(date));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employee.employeeName, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  employee.employeeCode,
                  style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          SegmentedButton<AttendanceStatus?>(
            segments: const [
              ButtonSegment(value: null, label: Text('P')),
              ButtonSegment(value: AttendanceStatus.halfDay, label: Text('H')),
              ButtonSegment(value: AttendanceStatus.absent, label: Text('A')),
            ],
            selected: {status},
            onSelectionChanged: locked ? null : (s) => _set(ref, s.first),
          ),
        ],
      ),
    );
  }
}
