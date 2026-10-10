import 'package:drift/drift.dart';

/// Chart of accounts — mirrors the real `ledger` table (documents/map.md
/// Appendix C), with two deliberate corrections called out there:
///  - `opening_balance` is `decimal` here, not the real schema's `bigint`
///    (Appendix C discrepancy #3 — the real column can't store paise).
///  - Sign convention preserved exactly: positive = Debit, negative =
///    Credit, for both opening_balance and current_balance (Module 4 rule
///    #1). The redundant `dc`/`dcCurrent` flags are kept for legacy-data
///    fidelity but should never be trusted over the sign in new code.
class LedgerTable extends Table {
  @override
  String get tableName => 'ledger';

  IntColumn get lid => integer().autoIncrement()();
  TextColumn get accountType => text().named('account_type')();
  TextColumn get accountName => text().named('account_name')();
  // Nullable/blank-allowed and NOT a DB-unique column: real-world ledger
  // data (documents/map.md Appendix C) shows many rows with a blank code,
  // so uniqueness is enforced in LedgerRepository only when a code is
  // actually supplied, mirroring the legacy app's AJAX uniqueness check.
  TextColumn get accountCode => text().named('account_code').withDefault(const Constant(''))();
  RealColumn get openingBalance =>
      real().named('opening_balance').withDefault(const Constant(0))();
  IntColumn get dc => integer().withDefault(const Constant(1))();
  TextColumn get other => text().nullable()();
  TextColumn get description => text().nullable()();
  RealColumn get currentBalance =>
      real().named('current_balance').withDefault(const Constant(0))();
  IntColumn get dcCurrent =>
      integer().named('dc_current').withDefault(const Constant(1))();
  DateTimeColumn get transDate =>
      dateTime().named('trans_date').withDefault(currentDateAndTime)();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
