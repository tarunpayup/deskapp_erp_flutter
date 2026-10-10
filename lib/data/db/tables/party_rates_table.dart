import 'package:drift/drift.dart';

import 'products_table.dart';
import 'traders_table.dart';

/// Party-wise product rates — mirrors the real `party_product_rates` table
/// (documents/map.md Appendix C discrepancy #? — the unique key is
/// `(party_id, product_id)` only, NOT `(party_id, product_id, unit_id)` as
/// the UI's repeatable-unit-rows might suggest). Preserved exactly: one
/// rate per party+product, whatever unit it's quoted in.
class PartyRatesTable extends Table {
  @override
  String get tableName => 'party_rates';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get partyId =>
      integer().named('party_id').references(TradersTable, #id)();
  IntColumn get productId =>
      integer().named('product_id').references(ProductsTable, #pid)();
  TextColumn get unit => text()();
  RealColumn get rate => real()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {partyId, productId},
  ];
}
