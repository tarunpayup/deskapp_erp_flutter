import 'package:drift/drift.dart';

import 'traders_table.dart';

/// Sales header — mirrors the real `sales` table (documents/map.md Module
/// 5), with one deliberate fix: line items live in their own
/// `SalesLineItemsTable` instead of the legacy's semicolon-delimited
/// multi-line strings (`product_name`/`qty`/`price_of_product`/... all
/// packed into single text columns) — that format can't be queried,
/// validated, or joined safely.
class SalesTable extends Table {
  @override
  String get tableName => 'sales';

  IntColumn get sid => integer().autoIncrement()();
  TextColumn get salesCode => text().named('sales_code')(); // SALE-####
  IntColumn get traderId =>
      integer().named('trader_id').references(TradersTable, #id)();
  DateTimeColumn get saleDate => dateTime().named('sale_date')();
  // Manually-entered taxable-value override (legacy o-tr-sales-new.php
  // "deliberate flexibility" — map.md flags the integrity risk if it
  // diverges from the line-item sum; validated against the line sum in
  // TradeRepository instead of trusted blindly).
  RealColumn get taxableValue => real().named('taxable_value')();
  RealColumn get cgstPercent =>
      real().named('cgst_percent').withDefault(const Constant(0))();
  RealColumn get sgstPercent =>
      real().named('sgst_percent').withDefault(const Constant(0))();
  RealColumn get igstPercent =>
      real().named('igst_percent').withDefault(const Constant(0))();
  RealColumn get totalAfterTax => real().named('total_after_tax')();
  TextColumn get deliveryMode => text().named('delivery_mode').nullable()();
  DateTimeColumn get dateOfDelivery =>
      dateTime().named('date_of_delivery').nullable()();
  TextColumn get paymentStatus =>
      text().named('payment_status').withDefault(const Constant('Pending'))();
  // Journal entry this sale posted — stored as a real FK instead of the
  // legacy's narration+date+amount matching (map.md flags that as fragile).
  IntColumn get journalEntryId => integer().named('journal_entry_id').nullable()();
  // Soft-reversed instead of hard-deleted, so the audit trail survives a
  // reversal (legacy hard-deletes the row) — the reversing journal entry
  // still cancels the accounting effect.
  BoolColumn get reversed =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
