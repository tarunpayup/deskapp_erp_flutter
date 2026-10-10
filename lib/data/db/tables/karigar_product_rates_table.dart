import 'package:drift/drift.dart';

import 'karigar_products_table.dart';
import 'karigars_table.dart';

/// Per-karigar/product/unit rate card — mirrors the real
/// `karigar_product_rates` table (documents/map.md Module 3 rule #7: a
/// hard prerequisite for single-item job allotment — the UI blocks
/// submission without an existing rate here).
class KarigarProductRatesTable extends Table {
  @override
  String get tableName => 'karigar_product_rates';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get karigarId =>
      integer().named('karigar_id').references(KarigarsTable, #karigarId)();
  IntColumn get productId =>
      integer().named('product_id').references(KarigarProductsTable, #id)();
  TextColumn get unit => text()();
  RealColumn get rate => real()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {karigarId, productId, unit},
  ];
}
