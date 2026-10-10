import 'package:drift/drift.dart';

import '../../../core/constants/account_types.dart';
import '../../../data/db/app_database.dart';
import '../../ledger/data/ledger_repository.dart';
import '../domain/payroll_models.dart';

/// Local-first repository for Employee/Attendance/Payroll (documents/
/// map.md Module 2): employee master, daily attendance marking, and
/// salary payments posting Dr Employee / Cr Cash through
/// [LedgerRepository.postJournalEntry] — the one canonical posting core
/// shared with Ledger/Trade, not duplicated here.
///
/// Deliberate fixes vs. the legacy PHP (documents/map.md Module 2):
///  - Attendance is real per-day exception rows (AttendanceTable), not a
///    JSON blob with two incompatible historical formats.
///  - The salary formula + "working days excluding Sundays" helper live
///    in one place ([SalaryCalculator]) instead of being copy-pasted
///    across 3 legacy files.
///  - A payment's journal entry is a real FK (`journal_entry_id`), not
///    found later by narration+date+amount matching.
///  - All payment+ledger+journal writes are transaction-wrapped (the
///    legacy had none).
class PayrollRepository {
  PayrollRepository(this._db, this._ledgerRepo);

  final AppDatabase _db;
  final LedgerRepository _ledgerRepo;

  // ---------------------------------------------------------------------
  // Employee master — legacy add-employee.php / edit-employee.php
  // ---------------------------------------------------------------------

  Stream<List<EmployeesTableData>> watchEmployees({String? status, String? search}) {
    final query = _db.select(_db.employeesTable)
      ..orderBy([(t) => OrderingTerm.asc(t.employeeName)]);
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (search != null && search.trim().isNotEmpty) {
      final like = '%${search.trim()}%';
      query.where((t) => t.employeeName.like(like) | t.employeeCode.like(like));
    }
    return query.watch();
  }

  Future<EmployeesTableData?> getEmployee(int id) {
    return (_db.select(
      _db.employeesTable,
    )..where((t) => t.employeeId.equals(id))).getSingleOrNull();
  }

  Future<bool> isMobileTaken(String mobNo, {int? excludeId}) async {
    final query = _db.select(_db.employeesTable)..where((t) => t.mobNo.equals(mobNo.trim()));
    if (excludeId != null) {
      query.where((t) => t.employeeId.equals(excludeId).not());
    }
    final row = await query.getSingleOrNull();
    return row != null;
  }

  Future<int> addEmployee({
    required String employeeName,
    required String mobNo,
    required DateTime dateOfJoining,
    required double salary,
    required SalaryType salaryType,
    String? fatherName,
    DateTime? dob,
    String? gender,
    String? alternateMobNo,
    String? email,
    String? address,
    String? state,
    String? city,
    String? pincode,
    String? aadhar,
    String? pan,
    String? designation,
    String? department,
    String? bankName,
    String? bankAccountNumber,
    String? bankIfsc,
    String? emergencyContactName,
    String? emergencyContactNumber,
  }) async {
    if (await isMobileTaken(mobNo)) {
      throw PayrollRepositoryException('Mobile number "$mobNo" is already registered');
    }
    final count = await _db.employeesTable.count().getSingle();
    final code = 'EMP-${(count + 1).toString().padLeft(3, '0')}';
    return _db.into(_db.employeesTable).insert(
      EmployeesTableCompanion.insert(
        employeeCode: code,
        employeeName: employeeName,
        mobNo: mobNo.trim(),
        dateOfJoining: dateOfJoining,
        salary: Value(salary),
        salaryType: Value(salaryType.value),
        fatherName: Value(fatherName),
        dob: Value(dob),
        gender: Value(gender),
        alternateMobNo: Value(alternateMobNo),
        email: Value(email),
        address: Value(address),
        state: Value(state),
        city: Value(city),
        pincode: Value(pincode),
        aadhar: Value(aadhar),
        pan: Value(pan),
        designation: Value(designation),
        department: Value(department),
        bankName: Value(bankName),
        bankAccountNumber: Value(bankAccountNumber),
        bankIfsc: Value(bankIfsc),
        emergencyContactName: Value(emergencyContactName),
        emergencyContactNumber: Value(emergencyContactNumber),
      ),
    );
  }

  Future<void> updateEmployee({
    required int employeeId,
    required String employeeName,
    required String mobNo,
    required DateTime dateOfJoining,
    required double salary,
    required SalaryType salaryType,
    String? fatherName,
    DateTime? dob,
    String? gender,
    String? alternateMobNo,
    String? email,
    String? address,
    String? state,
    String? city,
    String? pincode,
    String? aadhar,
    String? pan,
    String? designation,
    String? department,
    String? bankName,
    String? bankAccountNumber,
    String? bankIfsc,
    String? emergencyContactName,
    String? emergencyContactNumber,
  }) async {
    if (await isMobileTaken(mobNo, excludeId: employeeId)) {
      throw PayrollRepositoryException('Mobile number "$mobNo" is already registered');
    }
    await (_db.update(_db.employeesTable)..where((t) => t.employeeId.equals(employeeId))).write(
      EmployeesTableCompanion(
        employeeName: Value(employeeName),
        mobNo: Value(mobNo.trim()),
        dateOfJoining: Value(dateOfJoining),
        salary: Value(salary),
        salaryType: Value(salaryType.value),
        fatherName: Value(fatherName),
        dob: Value(dob),
        gender: Value(gender),
        alternateMobNo: Value(alternateMobNo),
        email: Value(email),
        address: Value(address),
        state: Value(state),
        city: Value(city),
        pincode: Value(pincode),
        aadhar: Value(aadhar),
        pan: Value(pan),
        designation: Value(designation),
        department: Value(department),
        bankName: Value(bankName),
        bankAccountNumber: Value(bankAccountNumber),
        bankIfsc: Value(bankIfsc),
        emergencyContactName: Value(emergencyContactName),
        emergencyContactNumber: Value(emergencyContactNumber),
      ),
    );
  }

  Future<void> toggleEmployeeStatus(int employeeId) async {
    final row = await getEmployee(employeeId);
    if (row == null) return;
    final next = row.status == 'Active' ? 'Not Active' : 'Active';
    await (_db.update(_db.employeesTable)..where((t) => t.employeeId.equals(employeeId))).write(
      EmployeesTableCompanion(status: Value(next)),
    );
  }

  // ---------------------------------------------------------------------
  // Attendance — legacy attendance.php / function_attendance.php. Active
  // employees only (legacy rule, preserved). Cannot mark future dates.
  // ---------------------------------------------------------------------

  Future<Map<int, AttendanceStatus>> getAttendanceForDate(DateTime date) async {
    final day = DateTime(date.year, date.month, date.day);
    final rows = await (_db.select(
      _db.attendanceTable,
    )..where((t) => t.date.equals(day))).get();
    return {
      for (final r in rows)
        if (AttendanceStatus.fromCode(r.status) != null) r.employeeId: AttendanceStatus.fromCode(r.status)!,
    };
  }

  /// Sets (or clears, if [status] is null — i.e. "Present") one
  /// employee's attendance for one day. Rejects future dates (legacy
  /// client-side rule, enforced here too).
  Future<void> setAttendance({
    required int employeeId,
    required DateTime date,
    AttendanceStatus? status,
  }) async {
    final day = DateTime(date.year, date.month, date.day);
    final today = DateTime.now();
    if (day.isAfter(DateTime(today.year, today.month, today.day))) {
      throw PayrollRepositoryException('Cannot mark attendance for a future date');
    }
    if (status == null) {
      await (_db.delete(_db.attendanceTable)
            ..where((t) => t.employeeId.equals(employeeId) & t.date.equals(day)))
          .go();
    } else {
      await _db
          .into(_db.attendanceTable)
          .insertOnConflictUpdate(
            AttendanceTableCompanion.insert(
              employeeId: employeeId,
              date: day,
              status: status.code,
            ),
          );
    }
  }

  /// "Mark All Present" bulk action — clears any exception rows for
  /// every active employee on [date].
  Future<void> markAllPresent(DateTime date) async {
    final day = DateTime(date.year, date.month, date.day);
    final employees = await (_db.select(
      _db.employeesTable,
    )..where((t) => t.status.equals('Active'))).get();
    await _db.transaction(() async {
      for (final e in employees) {
        await (_db.delete(_db.attendanceTable)
              ..where((t) => t.employeeId.equals(e.employeeId) & t.date.equals(day)))
            .go();
      }
    });
  }

  /// Tallies one employee's attendance for [year]/[month], used by both
  /// the Attendance Report and the Payroll salary calculation (see
  /// [SalaryCalculator]). Current month prorates to today; past months
  /// use the full month; future months are rejected.
  Future<AttendanceTally> getMonthTally(int employeeId, int year, int month) async {
    final now = DateTime.now();
    final isFuture = DateTime(year, month) .isAfter(DateTime(now.year, now.month));
    if (isFuture) {
      throw PayrollRepositoryException('Cannot compute salary for a future month');
    }
    final isCurrentMonth = year == now.year && month == now.month;
    final workingDays = SalaryCalculator.workingDaysInMonth(year, month);
    final workingDaysTillToday = isCurrentMonth
        ? SalaryCalculator.workingDaysTillDate(year, month, now.day)
        : workingDays;

    final monthStart = DateTime(year, month, 1);
    final monthEnd = DateTime(year, month + 1, 1);
    final rows = await (_db.select(_db.attendanceTable)
          ..where(
            (t) =>
                t.employeeId.equals(employeeId) &
                t.date.isBiggerOrEqualValue(monthStart) &
                t.date.isSmallerThanValue(monthEnd),
          ))
        .get();

    final absentDays = rows.where((r) => r.status == AttendanceStatus.absent.code).length;
    final halfDays = rows.where((r) => r.status == AttendanceStatus.halfDay.code).length;

    return AttendanceTally(
      workingDays: workingDays,
      workingDaysTillToday: workingDaysTillToday,
      absentDays: absentDays,
      halfDays: halfDays,
    );
  }

  // ---------------------------------------------------------------------
  // Payroll — legacy payroll.php / function_payroll.php: Dr Employee /
  // Cr Cash, posted through LedgerRepository's canonical core.
  // ---------------------------------------------------------------------

  Stream<List<EmployeePaymentsTableData>> watchPayments(int employeeId) {
    return (_db.select(_db.employeePaymentsTable)
          ..where((t) => t.employeeId.equals(employeeId))
          ..orderBy([(t) => OrderingTerm.desc(t.paymentDate)]))
        .watch();
  }

  /// Lifetime cumulative credited (sum of each month's computed salary
  /// from date of joining through the current month) minus lifetime paid
  /// — the "Current balance" the legacy keeps as a separate running total
  /// from the period-specific "Balance".
  Future<double> getLifetimeBalance(EmployeesTableData employee) async {
    final salaryType = SalaryType.fromValue(employee.salaryType);
    var credited = 0.0;
    var cursor = DateTime(employee.dateOfJoining.year, employee.dateOfJoining.month);
    final now = DateTime.now();
    final end = DateTime(now.year, now.month);
    while (!cursor.isAfter(end)) {
      final tally = await getMonthTally(employee.employeeId, cursor.year, cursor.month);
      credited += SalaryCalculator.computeCredited(
        salaryType: salaryType,
        salary: employee.salary,
        tally: tally,
      );
      cursor = DateTime(cursor.year, cursor.month + 1);
    }
    final paid = await _totalPaid(employee.employeeId);
    return credited - paid;
  }

  Future<double> _totalPaid(int employeeId, {DateTime? from, DateTime? to}) async {
    final query = _db.selectOnly(_db.employeePaymentsTable)
      ..addColumns([_db.employeePaymentsTable.amount.sum()])
      ..where(_db.employeePaymentsTable.employeeId.equals(employeeId));
    if (from != null) query.where(_db.employeePaymentsTable.paymentDate.isBiggerOrEqualValue(from));
    if (to != null) query.where(_db.employeePaymentsTable.paymentDate.isSmallerOrEqualValue(to));
    final row = await query.getSingleOrNull();
    return (row?.read(_db.employeePaymentsTable.amount.sum()) ?? 0).toDouble();
  }

  /// Period balance (credited for [year]/[month] minus paid in that same
  /// month) — distinct from [getLifetimeBalance] (see its doc).
  Future<double> getMonthBalance(EmployeesTableData employee, int year, int month) async {
    final tally = await getMonthTally(employee.employeeId, year, month);
    final credited = SalaryCalculator.computeCredited(
      salaryType: SalaryType.fromValue(employee.salaryType),
      salary: employee.salary,
      tally: tally,
    );
    final monthStart = DateTime(year, month, 1);
    final monthEnd = DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final paid = await _totalPaid(employee.employeeId, from: monthStart, to: monthEnd);
    return credited - paid;
  }

  /// Posts a salary payment: Dr Employee / Cr Cash (legacy
  /// createEmployeePaymentJournalEntry, map.md Module 2), amount enforced
  /// as a positive integer (legacy rule, preserved).
  Future<int> addPayment({
    required int employeeId,
    required DateTime paymentDate,
    required int amount,
  }) async {
    if (amount <= 0) {
      throw PayrollRepositoryException('Amount must be a positive integer');
    }
    return _db.transaction(() async {
      final employeeLid = await _ledgerRepo.ensureSystemAccount(
        SystemAccounts.employee,
        'Current Liability',
      );
      final cashLid = await _ledgerRepo.ensureSystemAccount(SystemAccounts.cash, 'Cash');

      final employee = await getEmployee(employeeId);
      final journalEntryId = await _ledgerRepo.postJournalEntry(
        voucherType: 'PAYROLL',
        voucherNo: _ledgerRepo.generateVoucherNo(),
        date: paymentDate,
        narration: 'Salary payment to ${employee?.employeeName ?? 'employee'}',
        lines: {employeeLid: amount.toDouble(), cashLid: -amount.toDouble()},
      );

      return _db.into(_db.employeePaymentsTable).insert(
        EmployeePaymentsTableCompanion.insert(
          employeeId: employeeId,
          paymentDate: paymentDate,
          amount: amount,
          journalEntryId: Value(journalEntryId),
        ),
      );
    });
  }

  /// Deletes a payment and reverses its journal entry (legacy edits the
  /// ledger/journal in place via narration matching — this posts an
  /// equal-and-opposite entry instead, same audit-trail-preserving
  /// pattern as TradeRepository's sale/procurement reversal).
  Future<void> deletePayment(int paymentId) async {
    final payment = await (_db.select(
      _db.employeePaymentsTable,
    )..where((t) => t.paymentId.equals(paymentId))).getSingleOrNull();
    if (payment == null) return;

    await _db.transaction(() async {
      if (payment.journalEntryId != null) {
        final details = await (_db.select(
          _db.journalEntryDetailsTable,
        )..where((t) => t.entryId.equals(payment.journalEntryId!))).get();
        final reversedLines = <int, double>{};
        for (final d in details) {
          reversedLines[d.accountId] = (reversedLines[d.accountId] ?? 0) - (d.debit - d.credit);
        }
        await _ledgerRepo.postJournalEntry(
          voucherType: 'PAYROLL-REVERSAL',
          voucherNo: _ledgerRepo.generateVoucherNo(),
          date: DateTime.now(),
          narration: 'Reversal of payment #$paymentId',
          lines: reversedLines,
        );
      }
      await (_db.delete(
        _db.employeePaymentsTable,
      )..where((t) => t.paymentId.equals(paymentId))).go();
    });
  }
}
