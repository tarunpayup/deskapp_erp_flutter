import 'package:drift/drift.dart';

import 'traders_table.dart';

/// Procurement header — mirrors the real `procurement` table
/// (documents/map.md Module 5), normalized the same way as SalesTable.
/// Includes "Other Expenses" (freight/packaging, added post-tax) — a real
/// feature present in the legacy procurement form but absent from sales.
class ProcurementTable extends Table {
  @override
  String get tableName => 'procurement';

  IntColumn get pid => integer().autoIncrement()();
  TextColumn get purchaseCode => text().named('purchase_code')(); // PROC-####
  IntColumn get traderId =>
      integer().named('trader_id').references(TradersTable, #id)();
  DateTimeColumn get purchaseDate => dateTime().named('purchase_date')();
  RealColumn get taxableValue => real().named('taxable_value')();
  RealColumn get cgstPercent =>
      real().named('cgst_percent').withDefault(const Constant(0))();
  RealColumn get sgstPercent =>
      real().named('sgst_percent').withDefault(const Constant(0))();
  RealColumn get igstPercent =>
      real().named('igst_percent').withDefault(const Constant(0))();
  RealColumn get otherExpenses =>
      real().named('other_expenses').withDefault(const Constant(0))();
  RealColumn get totalAfterTax => real().named('total_after_tax')();
  IntColumn get journalEntryId => integer().named('journal_entry_id').nullable()();
  BoolColumn get reversed =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
