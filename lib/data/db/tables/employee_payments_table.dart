import 'package:drift/drift.dart';

import 'employees_table.dart';

/// Salary payments — mirrors the real `employee_salary_payments` table
/// (documents/map.md Module 2), with one fix: `journal_entry_id` is a
/// real FK here, not found later by narration+date+amount matching (the
/// legacy pattern map.md flags as fragile and able to silently desync
/// accounting from payments if the match fails).
class EmployeePaymentsTable extends Table {
  @override
  String get tableName => 'employee_salary_payments';

  IntColumn get paymentId => integer().autoIncrement()();
  IntColumn get employeeId =>
      integer().named('employee_id').references(EmployeesTable, #employeeId)();
  DateTimeColumn get paymentDate => dateTime().named('payment_date')();
  // Positive integer rupees — legacy enforces this client+server (map.md).
  IntColumn get amount => integer()();
  IntColumn get journalEntryId => integer().named('journal_entry_id').nullable()();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
