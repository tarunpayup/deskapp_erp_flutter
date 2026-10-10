import 'package:drift/drift.dart';

/// Process master (e.g. Chain Making, Polishing) — mirrors the real
/// `work_types` table (documents/map.md Module 3). Deletion is blocked
/// while any karigar references it (rule #6) — enforced in
/// KarigarRepository, not here.
class WorkTypesTable extends Table {
  @override
  String get tableName => 'work_types';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
