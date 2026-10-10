import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/attendance_table.dart';
import 'tables/daily_cash_balance_table.dart';
import 'tables/employee_payments_table.dart';
import 'tables/employees_table.dart';
import 'tables/job_work_allotments_table.dart';
import 'tables/job_work_receipt_line_items_table.dart';
import 'tables/job_work_receipts_table.dart';
import 'tables/job_work_remarks_table.dart';
import 'tables/journal_entries_table.dart';
import 'tables/journal_entry_details_table.dart';
import 'tables/karigar_job_work_line_items_table.dart';
import 'tables/karigar_job_work_table.dart';
import 'tables/karigar_payments_table.dart';
import 'tables/karigar_product_rates_table.dart';
import 'tables/karigar_products_table.dart';
import 'tables/karigars_table.dart';
import 'tables/ledger_table.dart';
import 'tables/party_rates_table.dart';
import 'tables/procurement_line_items_table.dart';
import 'tables/procurement_table.dart';
import 'tables/products_table.dart';
import 'tables/sales_line_items_table.dart';
import 'tables/sales_table.dart';
import 'tables/traders_table.dart';
import 'tables/users_table.dart';
import 'tables/work_types_table.dart';
import 'seed/seed_ledger.dart';
import 'seed/seed_users.dart';

part 'app_database.g.dart';

/// Local-first app database. Each module's tables are added here as that
/// module is built (per documents/map.md). Seeded with representative
/// fixture data (never the real business's production data — see
/// seed_ledger.dart) so the app is usable offline from first run —
/// repositories are the seam where a real backend API will later replace
/// direct table access (see documents/map.md Executive Summary).
@DriftDatabase(
  tables: [
    UsersTable,
    LedgerTable,
    JournalEntriesTable,
    JournalEntryDetailsTable,
    DailyCashBalanceTable,
    TradersTable,
    ProductsTable,
    PartyRatesTable,
    SalesTable,
    SalesLineItemsTable,
    ProcurementTable,
    ProcurementLineItemsTable,
    EmployeesTable,
    AttendanceTable,
    EmployeePaymentsTable,
    WorkTypesTable,
    KarigarProductsTable,
    KarigarsTable,
    KarigarProductRatesTable,
    KarigarJobWorkTable,
    KarigarJobWorkLineItemsTable,
    JobWorkAllotmentsTable,
    JobWorkReceiptsTable,
    JobWorkReceiptLineItemsTable,
    JobWorkRemarksTable,
    KarigarPaymentsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await seedUsers(this);
      await seedLedger(this);
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Module 5 (Trade/Sales) tables, added after the initial release.
        await m.createTable(tradersTable);
        await m.createTable(productsTable);
        await m.createTable(partyRatesTable);
        await m.createTable(salesTable);
        await m.createTable(salesLineItemsTable);
        await m.createTable(procurementTable);
        await m.createTable(procurementLineItemsTable);
      }
      if (from < 3) {
        // Module 2 (Employee/Attendance/Payroll) tables.
        await m.createTable(employeesTable);
        await m.createTable(attendanceTable);
        await m.createTable(employeePaymentsTable);
      }
      if (from < 4) {
        // Module 3 (Karigar/Job-Work) tables.
        await m.createTable(workTypesTable);
        await m.createTable(karigarProductsTable);
        await m.createTable(karigarsTable);
        await m.createTable(karigarProductRatesTable);
        await m.createTable(karigarJobWorkTable);
        await m.createTable(karigarJobWorkLineItemsTable);
        await m.createTable(jobWorkAllotmentsTable);
        await m.createTable(jobWorkReceiptsTable);
        await m.createTable(jobWorkReceiptLineItemsTable);
        await m.createTable(jobWorkRemarksTable);
        await m.createTable(karigarPaymentsTable);
      }
    },
  );

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'deskapp.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
