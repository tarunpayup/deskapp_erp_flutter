import 'package:drift/drift.dart';

import 'job_work_receipts_table.dart';
import 'karigar_job_work_line_items_table.dart';

/// Per-product quantities received against one multi-item receipt event
/// — see JobWorkReceiptsTable doc. `amount` = `rate × qtyReceivedNow` for
/// this line, summed into the parent receipt's `amountCredited`.
class JobWorkReceiptLineItemsTable extends Table {
  @override
  String get tableName => 'job_work_receipt_line_items';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId =>
      integer().named('receipt_id').references(JobWorkReceiptsTable, #id)();
  IntColumn get jobWorkLineItemId => integer()
      .named('job_work_line_item_id')
      .references(KarigarJobWorkLineItemsTable, #id)();
  RealColumn get qtyReceivedNow => real().named('qty_received_now')();
  RealColumn get amount => real()();
}
