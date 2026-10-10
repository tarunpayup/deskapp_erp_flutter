import 'package:drift/drift.dart';

import 'work_types_table.dart';

/// Product master scoped to a process — mirrors the real
/// `karigar_products` table (documents/map.md Module 3). Units are a
/// comma-joined list from the one canonical [tradeUnits] list (see
/// account_types.dart — the legacy had two inconsistent unit lists here,
/// reconciled already for Module 5, reused for Module 3).
class KarigarProductsTable extends Table {
  @override
  String get tableName => 'karigar_products';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get workTypeId =>
      integer().named('work_type_id').references(WorkTypesTable, #id)();
  TextColumn get productName => text().named('product_name')();
  TextColumn get units => text()();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
