import 'package:drift/drift.dart';

/// Product master — mirrors the real `products` table (documents/map.md
/// Module 5). The legacy schema stores allowed units as a CSV string on
/// this row (`unit`/`unit_id`); kept here too (comma-joined) rather than a
/// separate join table, since the unit list is short and this is exactly
/// what the rate-card UI (party rates) needs to read back as a whole.
class ProductsTable extends Table {
  @override
  String get tableName => 'products';

  IntColumn get pid => integer().autoIncrement()();
  TextColumn get productCode => text().named('product_code')(); // PRODUCT-####
  TextColumn get productName => text().named('product_name')();
  RealColumn get basePrice =>
      real().named('base_price').withDefault(const Constant(0))();
  // Comma-joined list of allowed units, e.g. "Kg,Gm,Pcs" — see class doc.
  TextColumn get units => text()();
  // 'Buy' | 'Sale' | 'Both' — legacy's transaction_type (1=Buy,2=Sale),
  // extended with 'Both' since nothing in the domain actually requires a
  // product to be exclusively one or the other.
  TextColumn get transactionType => text().named('transaction_type')();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
