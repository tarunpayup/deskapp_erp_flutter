import 'package:drift/drift.dart';

import 'procurement_table.dart';
import 'products_table.dart';

class ProcurementLineItemsTable extends Table {
  @override
  String get tableName => 'procurement_line_items';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get purchaseId =>
      integer().named('purchase_id').references(ProcurementTable, #pid)();
  IntColumn get productId =>
      integer().named('product_id').references(ProductsTable, #pid)();
  TextColumn get productName => text().named('product_name')();
  TextColumn get unit => text()();
  RealColumn get qty => real()();
  RealColumn get priceOfProduct => real().named('price_of_product')();
  RealColumn get taxableValue => real().named('taxable_value')();
}
