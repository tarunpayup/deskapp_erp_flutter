import 'package:drift/drift.dart';

import 'ledger_table.dart';

/// Trader (Customer/Vendor) master — mirrors the real `traders` table
/// (documents/map.md Module 5). Every trader also gets a matching
/// `LedgerTable` row (Sundry Debtor/Creditor) created atomically alongside
/// it in TradeRepository.addTrader — same as the legacy `add-customer` /
/// `add-vendor` blocks, but FK-linked here instead of looked-up by name.
class TradersTable extends Table {
  @override
  String get tableName => 'traders';

  IntColumn get id => integer().autoIncrement()();
  // CUST-#### / VEND-#### display code (legacy-style, kept for familiarity).
  TextColumn get traderCode => text().named('trader_code')();
  IntColumn get ledgerId =>
      integer().named('ledger_id').references(LedgerTable, #lid)();
  TextColumn get traderName => text().named('trader_name')();
  // 'Customer' | 'Vendor' — legacy's `st` (1/2) replaced with a readable enum.
  TextColumn get traderType => text().named('trader_type')();
  TextColumn get gstin => text().nullable()();
  TextColumn get panCard => text().named('pan_card').nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get telephone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get pincode => text().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
