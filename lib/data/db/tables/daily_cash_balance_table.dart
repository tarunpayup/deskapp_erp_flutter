import 'package:drift/drift.dart';

/// Daily cash snapshot — mirrors the real `daily_cash_balance` table
/// (documents/map.md Appendix C / Module 4 rule #9). In the legacy app
/// this was populated by a nightly OS cron job (cron_daily_balance.php);
/// here it's written by a scheduled local job (see LedgerRepository) since
/// there's no server crontab in a mobile-first architecture.
class DailyCashBalanceTable extends Table {
  @override
  String get tableName => 'daily_cash_balance';

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get balanceDate => dateTime().named('balance_date')();
  RealColumn get openingBalance =>
      real().named('opening_balance').withDefault(const Constant(0))();
  RealColumn get closingBalance =>
      real().named('closing_balance').withDefault(const Constant(0))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {balanceDate},
  ];
}
