import 'package:drift/drift.dart';

import 'journal_entries_table.dart';
import 'ledger_table.dart';

/// Journal voucher lines — mirrors the real `journal_entry_details` table
/// (documents/map.md Appendix C), but with **real foreign keys** added,
/// which Appendix C discrepancy #4 flagged as entirely absent in the legacy
/// MySQL schema (every relationship there is enforced only by application
/// code). `accountId` is a true FK to `ledger.lid` here — the legacy
/// column's "sometimes points to traders.id instead" ambiguity
/// (Appendix C discrepancy #1 / o-t-journal.php's COALESCE handling) is
/// deliberately not replicated: once Module 5 (traders) exists, a trader
/// always has a backing ledger row, so journal lines can always resolve
/// through `ledger` alone.
class JournalEntryDetailsTable extends Table {
  @override
  String get tableName => 'journal_entry_details';

  IntColumn get detailId => integer().autoIncrement()();
  IntColumn get entryId =>
      integer().named('entry_id').references(JournalEntriesTable, #entryId)();
  IntColumn get accountId =>
      integer().named('account_id').references(LedgerTable, #lid)();
  RealColumn get debit => real().withDefault(const Constant(0))();
  RealColumn get credit => real().withDefault(const Constant(0))();
}
