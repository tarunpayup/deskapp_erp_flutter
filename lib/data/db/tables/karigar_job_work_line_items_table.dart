import 'package:drift/drift.dart';

import 'karigar_job_work_table.dart';
import 'karigar_products_table.dart';

/// Per-product targets for a multi-item job-work lot (documents/map.md
/// Module 3 rule #3: "no receive_value concept; total_amount_credited =
/// Σ(rate × qty) per product line"). `qtyReceived` is cumulative, updated
/// by each receipt's line items (see KarigarJobWorkReceiptLineItemsTable).
class KarigarJobWorkLineItemsTable extends Table {
  @override
  String get tableName => 'karigar_job_work_line_items';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get jobWorkId =>
      integer().named('job_work_id').references(KarigarJobWorkTable, #id)();
  IntColumn get productId =>
      integer().named('product_id').references(KarigarProductsTable, #id)();
  TextColumn get unit => text()();
  RealColumn get rate => real()();
  RealColumn get qtyAllotted => real().named('qty_allotted')();
  RealColumn get qtyReceived =>
      real().named('qty_received').withDefault(const Constant(0))();
}
