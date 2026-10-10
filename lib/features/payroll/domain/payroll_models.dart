/// 'Monthly' | 'Weekly' | 'Daily' — drives the salary formula below.
enum SalaryType {
  monthly('Monthly'),
  weekly('Weekly'),
  daily('Daily');

  const SalaryType(this.value);
  final String value;

  static SalaryType fromValue(String v) =>
      SalaryType.values.firstWhere((e) => e.value == v, orElse: () => SalaryType.monthly);
}

/// 'A' (Absent) | 'H' (Half-day) — 'Present' is never stored (see
/// AttendanceTable doc).
enum AttendanceStatus {
  absent('A'),
  halfDay('H');

  const AttendanceStatus(this.code);
  final String code;

  static AttendanceStatus? fromCode(String? code) {
    switch (code) {
      case 'A':
        return AttendanceStatus.absent;
      case 'H':
        return AttendanceStatus.halfDay;
      default:
        return null;
    }
  }
}

/// A month's attendance tally for one employee, used by both the
/// Attendance screen and the Payroll salary calculation — see
/// [SalaryCalculator].
class AttendanceTally {
  const AttendanceTally({
    required this.workingDays,
    required this.workingDaysTillToday,
    required this.absentDays,
    required this.halfDays,
  });

  final int workingDays;
  final int workingDaysTillToday;
  final int absentDays;
  final int halfDays;

  double get presentEquivalent {
    final v = workingDaysTillToday - absentDays - 0.5 * halfDays;
    return v < 0 ? 0 : v;
  }
}

/// The salary formula — centralized here instead of duplicated across 3
/// legacy files (documents/map.md Module 2 conversion notes: "Centralize
/// the salary formula + working days excluding Sundays helper into one
/// tested shared service").
abstract class SalaryCalculator {
  /// Working days in [year]/[month], excluding Sundays (legacy's
  /// hardcoded rule — no configurable holiday calendar, preserved as-is).
  static int workingDaysInMonth(int year, int month) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    var count = 0;
    for (var d = 1; d <= daysInMonth; d++) {
      if (DateTime(year, month, d).weekday != DateTime.sunday) count++;
    }
    return count;
  }

  /// Working days from the 1st of the month up to (and including) [upTo],
  /// excluding Sundays — used to prorate the current month.
  static int workingDaysTillDate(int year, int month, int upTo) {
    var count = 0;
    for (var d = 1; d <= upTo; d++) {
      if (DateTime(year, month, d).weekday != DateTime.sunday) count++;
    }
    return count;
  }

  /// `credited = salary × presentEquivalent` (daily),
  /// `(salary/6) × presentEquivalent` (weekly, 6-day week assumption),
  /// `(salary / workingDaysInMonth) × presentEquivalent` (monthly,
  /// default) — exact formula from documents/map.md Module 2.
  static double computeCredited({
    required SalaryType salaryType,
    required double salary,
    required AttendanceTally tally,
  }) {
    final presentEquivalent = tally.presentEquivalent;
    switch (salaryType) {
      case SalaryType.daily:
        return salary * presentEquivalent;
      case SalaryType.weekly:
        return (salary / 6) * presentEquivalent;
      case SalaryType.monthly:
        if (tally.workingDays == 0) return 0;
        return (salary / tally.workingDays) * presentEquivalent;
    }
  }
}

class PayrollRepositoryException implements Exception {
  PayrollRepositoryException(this.message);
  final String message;
  @override
  String toString() => message;
}
