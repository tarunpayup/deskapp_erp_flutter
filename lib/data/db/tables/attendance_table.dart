import 'package:drift/drift.dart';

import 'employees_table.dart';

/// Daily attendance — mirrors the real `employee_attendance` table's
/// intent, but normalized to one real row per exception day (documents/
/// map.md Module 2 conversion notes: "Normalize attendance to a real
/// per-day table... eliminating the JSON exception-map and its dual-
/// format parser" — the legacy stored a whole month's exceptions as a
/// single JSON blob column with two incompatible historical formats).
/// Only Absent/Half-day rows are stored (present is the default for any
/// working day with no row) — same exception-only semantics as the
/// legacy, just as queryable rows instead of an opaque blob.
class AttendanceTable extends Table {
  @override
  String get tableName => 'attendance';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get employeeId =>
      integer().named('employee_id').references(EmployeesTable, #employeeId)();
  DateTimeColumn get date => dateTime()();
  // 'A' (Absent) | 'H' (Half-day) — 'P' (Present) is never stored, it's
  // the implicit default (see class doc).
  TextColumn get status => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {employeeId, date},
  ];
}
