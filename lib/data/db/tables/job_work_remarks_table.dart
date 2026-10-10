import 'package:drift/drift.dart';

import 'karigar_job_work_table.dart';

/// Free-text remark log — mirrors the real `job_work_remarks` table
/// (documents/map.md Module 3), used by the "Remark" branch of the
/// Receive flow (Yes/No/Remark).
class JobWorkRemarksTable extends Table {
  @override
  String get tableName => 'job_work_remarks';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get jobWorkId =>
      integer().named('job_work_id').references(KarigarJobWorkTable, #id)();
  TextColumn get remark => text()();
  DateTimeColumn get remarkDate => dateTime().named('remark_date')();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
