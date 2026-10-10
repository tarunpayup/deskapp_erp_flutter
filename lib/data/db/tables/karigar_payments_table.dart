import 'package:drift/drift.dart';

import 'karigars_table.dart';

/// Payments to/adjustments for a karigar — mirrors the real
/// `karigar_payments` table (documents/map.md Module 3). `amountDr` =
/// cash paid to the karigar; `amountCr` = a credit adjustment (not a
/// receipt-driven wage credit, which lives in JobWorkReceiptsTable) — see
/// KarigarsTable doc for the balance sign convention these feed into.
class KarigarPaymentsTable extends Table {
  @override
  String get tableName => 'karigar_payments';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get karigarId =>
      integer().named('karigar_id').references(KarigarsTable, #karigarId)();
  DateTimeColumn get paymentDate => dateTime().named('payment_date')();
  RealColumn get amountDr =>
      real().named('amount_dr').withDefault(const Constant(0))();
  RealColumn get amountCr =>
      real().named('amount_cr').withDefault(const Constant(0))();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
