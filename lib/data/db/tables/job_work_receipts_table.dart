import 'package:drift/drift.dart';

import 'karigar_job_work_table.dart';

/// Receipt history — mirrors the real `job_work_receipts` table
/// (documents/map.md Module 3). For single-item lots, `weightReceived`
/// (gross quantity received) and `receiveValue` (manually-entered net
/// weight for wages — rule #2, deliberately decoupled from the physical
/// quantity) drive `amountCredited` directly. For multi-item lots both
/// are null and the credited amount instead comes from summing this
/// receipt's `KarigarJobWorkReceiptLineItemsTable` rows (rule #3).
class JobWorkReceiptsTable extends Table {
  @override
  String get tableName => 'job_work_receipts';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get jobWorkId =>
      integer().named('job_work_id').references(KarigarJobWorkTable, #id)();
  RealColumn get weightReceived => real().named('weight_received').nullable()();
  RealColumn get receiveValue => real().named('receive_value').nullable()();
  RealColumn get amountCredited => real().named('amount_credited')();
  DateTimeColumn get receiveDate => dateTime().named('receive_date')();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
