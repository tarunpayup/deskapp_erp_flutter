import 'package:drift/drift.dart';

import 'karigar_products_table.dart';
import 'karigars_table.dart';
import 'work_types_table.dart';

/// Job-work lot header — mirrors the real `karigar_job_work` table
/// (documents/map.md Module 3). `product_id`/`rate`/`unit` are only set
/// for single-item lots (`isMulti = false`); multi-item lots carry their
/// per-product targets in `KarigarJobWorkLineItemsTable` instead (see
/// that table's doc). `quantity`/`quantityRec` are cumulative weight
/// allotted/received, tracked independently of money (rule #5).
class KarigarJobWorkTable extends Table {
  @override
  String get tableName => 'karigar_job_work';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get jobCode => text().named('job_code')(); // JOB-####
  IntColumn get workTypeId =>
      integer().named('work_type_id').references(WorkTypesTable, #id)();
  IntColumn get karigarId =>
      integer().named('karigar_id').references(KarigarsTable, #karigarId)();
  // Single-item only — null for multi-item lots.
  IntColumn get productId =>
      integer().named('product_id').nullable().references(KarigarProductsTable, #id)();
  RealColumn get rate => real().nullable()();
  TextColumn get unit => text().nullable()();
  RealColumn get quantity => real().withDefault(const Constant(0))(); // cumulative allotted
  RealColumn get quantityRec =>
      real().named('quantity_rec').withDefault(const Constant(0))(); // cumulative received
  BoolColumn get isMulti =>
      boolean().named('is_multi').withDefault(const Constant(false))();
  TextColumn get status =>
      text().withDefault(const Constant('Open'))(); // Open | Completed
  DateTimeColumn get allotDate => dateTime().named('allot_date')();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
