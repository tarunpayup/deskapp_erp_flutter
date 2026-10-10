import 'package:drift/drift.dart';

import 'karigar_job_work_table.dart';

/// Weight-only allotment history (origin allotment + "Allot More" events)
/// — mirrors the real `job_work_allotments` table (documents/map.md
/// Module 3). Tracked independently of money (rule #5).
class JobWorkAllotmentsTable extends Table {
  @override
  String get tableName => 'job_work_allotments';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get jobWorkId =>
      integer().named('job_work_id').references(KarigarJobWorkTable, #id)();
  RealColumn get weight => real()();
  DateTimeColumn get allotDate => dateTime().named('allot_date')();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
