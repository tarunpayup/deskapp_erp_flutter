import 'package:drift/drift.dart';

import 'products_table.dart';
import 'sales_table.dart';

/// Normalized sales line items — see sales_table.dart doc for why this
/// replaces the legacy's semicolon-delimited strings.
class SalesLineItemsTable extends Table {
  @override
  String get tableName => 'sales_line_items';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get salesId =>
      integer().named('sales_id').references(SalesTable, #sid)();
  IntColumn get productId =>
      integer().named('product_id').references(ProductsTable, #pid)();
  TextColumn get productName => text().named('product_name')();
  TextColumn get unit => text()();
  RealColumn get qty => real()();
  RealColumn get priceOfProduct => real().named('price_of_product')();
  RealColumn get taxableValue => real().named('taxable_value')();
}
