import 'package:drift/drift.dart';

import '../app_database.dart';

/// Seeds representative chart-of-accounts fixtures — the same shape of
/// accounts the real business uses (Cash/Bank/Sales/Procurement/GST/sample
/// debtor & creditor), but NOT the real business's actual customer/vendor
/// names or balances (see documents/map.md Appendix C — that data is real
/// and shouldn't be bundled into app source). A proper "import my data"
/// feature is the right way to load the real chart of accounts later.
Future<void> seedLedger(AppDatabase db) async {
  await db.batch((batch) {
    batch.insertAll(db.ledgerTable, [
      _system(1, 'Cash', 'Cash', 'CASH', -50000),
      _system(2, 'Bank', 'Sample Bank A/C', 'BANK01', 250000),
      _system(3, 'Sales', 'Sales', 'SALES', -180000),
      _system(4, 'Procurement', 'Procurement', 'PROC', 95000),
      _system(5, 'Current Liability', 'Central GST', 'CGST', 0),
      _system(6, 'Current Liability', 'State GST', 'SGST', 0),
      _system(7, 'Current Liability', 'IGST', 'IGST', 0),
      _system(8, 'Current asset', 'Central GST Input', 'CGSTin', 0),
      _system(9, 'Current asset', 'State GST Input', 'SGSTin', 0),
      _system(10, 'Current asset', 'IGST Input', 'IGSTin', 0),
      _system(11, 'Expense', 'Employee', 'EMP', 0),
      _system(12, 'Expense', 'Karigar', 'KAR', 0),
      LedgerTableCompanion.insert(
        lid: const Value(13),
        accountType: 'Sundry Debtor',
        accountName: 'Sample Customer Pvt Ltd',
        accountCode: const Value('CUST-001'),
        openingBalance: const Value(12000),
        currentBalance: const Value(12000),
        dc: const Value(1),
        dcCurrent: const Value(1),
      ),
      LedgerTableCompanion.insert(
        lid: const Value(14),
        accountType: 'Sundry Creditor',
        accountName: 'Sample Vendor Traders',
        accountCode: const Value('VEND-001'),
        openingBalance: const Value(-8000),
        currentBalance: const Value(-8000),
        dc: const Value(2),
        dcCurrent: const Value(2),
      ),
    ]);
  });
}

LedgerTableCompanion _system(
  int lid,
  String type,
  String name,
  String code,
  double balance,
) {
  return LedgerTableCompanion.insert(
    lid: Value(lid),
    accountType: type,
    accountName: name,
    accountCode: Value(code),
    openingBalance: const Value(0),
    currentBalance: Value(balance),
    dc: const Value(1),
    dcCurrent: Value(balance >= 0 ? 1 : 2),
  );
}
