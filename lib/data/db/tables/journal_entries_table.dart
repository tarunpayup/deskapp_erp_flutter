import 'package:drift/drift.dart';

/// Journal voucher header — mirrors the real `journal_entries` table
/// (documents/map.md Appendix C). `voucherNo` here is a generated
/// opaque string (not `time()` as in the legacy PHP, which risked
/// same-second collisions — Module 2/4 notes).
class JournalEntriesTable extends Table {
  @override
  String get tableName => 'journal_entries';

  IntColumn get entryId => integer().autoIncrement()();
  TextColumn get voucherType =>
      text().named('voucher_type')(); // CASH | BANK | SALES | PURCHASE
  TextColumn get voucherNo => text().named('voucher_no')();
  DateTimeColumn get entryDate => dateTime().named('entry_date')();
  TextColumn get narration => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
