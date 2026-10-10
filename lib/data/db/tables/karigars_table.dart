import 'package:drift/drift.dart';

import 'work_types_table.dart';

/// Karigar (outsourced artisan) master — mirrors the real `karigar` table
/// (documents/map.md Module 3). The karigar financial ledger (Credit =
/// wages earned + credit adjustments, Debit = cash paid; positive balance
/// = firm owes karigar/"Payable", negative = karigar owes firm/"Advance"
/// — rule #4) is self-contained to this module in the legacy app (no
/// journal_entries posting is documented for it), so it's kept separate
/// from the company's main double-entry Ledger module here too, matching
/// documented legacy scope exactly.
class KarigarsTable extends Table {
  @override
  String get tableName => 'karigar';

  IntColumn get karigarId => integer().autoIncrement()();
  TextColumn get karigarCode => text().named('karigar_code')(); // KRG-NNN
  TextColumn get karigarName => text().named('karigar_name')();
  TextColumn get mobile => text()();
  TextColumn get address => text().nullable()();
  TextColumn get aadhar => text().nullable()();
  TextColumn get pan => text().nullable()();
  RealColumn get openingBalance =>
      real().named('opening_balance').withDefault(const Constant(0))();
  // 'Advance' | 'Payable' — see class doc sign convention.
  TextColumn get openingBalanceType => text().named('opening_balance_type')();
  TextColumn get bankName => text().named('bank_name').nullable()();
  TextColumn get bankAccountNumber => text().named('bank_account_number').nullable()();
  TextColumn get bankIfsc => text().named('bank_ifsc').nullable()();
  IntColumn get workTypeId =>
      integer().named('work_type_id').references(WorkTypesTable, #id)();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {mobile},
  ];
}
