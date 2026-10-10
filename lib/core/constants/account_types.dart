/// The fixed Ledger "Account Type" taxonomy, transcribed from the legacy
/// o-t-ledger-add.php dropdown (documents/map.md Module 4). Grouped exactly
/// as the legacy UI grouped them, with one fix: the legacy "Expense" group
/// was mislabeled "Liability" (a pre-existing UI bug, map.md Module 4) —
/// corrected here.
class AccountTypeGroup {
  const AccountTypeGroup(this.label, this.types);
  final String label;
  final List<String> types;
}

const accountTypeGroups = <AccountTypeGroup>[
  AccountTypeGroup('Assets', [
    'Other asset',
    'Current asset',
    'Other current asset',
    'Cash',
    'Bank',
    'Fixed asset',
    'Accounts receivable',
    'Stock',
    'Payment clearing account',
    'Intangible asset',
    'Non current asset',
    'Deferred Tax Asset',
  ]),
  AccountTypeGroup('Clients', ['Sundry Debtor', 'Sundry Creditor']),
  AccountTypeGroup('Liability', [
    'Current Liability',
    'Other Current Liability',
    'Credit Card',
    'Non Current Liability',
    'Other Liability',
    'Accounts Payable',
    'Overseas Tax Payable',
    'Deferred Tax Liability',
  ]),
  AccountTypeGroup('Equity', ['Equity']),
  AccountTypeGroup('Income', ['Income', 'Other Income', 'Sales']),
  AccountTypeGroup('Expense', [
    'Expense',
    'Indirect Expense',
    'Cost of Goods Sold',
    'Other Expense',
    'Procurement',
  ]),
];

/// Display label for an account type when it differs from its stored value
/// (the legacy dropdown shows "Sundry Debtors"/"Sundry Creditors" — plural —
/// for the singular stored `account_type` values).
String accountTypeDisplayLabel(String accountType) {
  switch (accountType) {
    case 'Sundry Debtor':
      return 'Sundry Debtors';
    case 'Sundry Creditor':
      return 'Sundry Creditors';
    default:
      return accountType;
  }
}

/// System account codes the ledger/cash/bank posting logic depends on by
/// name (mirrors function.php's name-based lookups, map.md Module 4) — kept
/// as named constants here instead of magic strings scattered through the
/// app, and so they're easy to find if/when this becomes config-driven.
abstract class SystemAccounts {
  static const cash = 'Cash';
  static const writeOff = 'Write Off';
  static const writeOffCode = 'WRITEOFF';

  // Module 5 (Trade/Sales) posting targets — auto-created if missing, same
  // pattern as the Write Off account (LedgerRepository._ensureSystemAccount).
  static const sales = 'Sales';
  static const cgstOutput = 'CGST Payable';
  static const sgstOutput = 'SGST Payable';
  static const igstOutput = 'IGST Payable';
  static const purchase = 'Purchase';
  static const cgstInput = 'CGST Input';
  static const sgstInput = 'SGST Input';
  static const igstInput = 'IGST Input';

  // Module 2 (Payroll) posting target — legacy createEmployeePaymentJournal
  // Entry() requires a ledger literally named 'Employee' to pre-exist and
  // fails silently (partial-success message) if missing (map.md Module 2);
  // auto-created here via the same ensureSystemAccount pattern instead.
  static const employee = 'Employee';
}

/// One canonical unit list for Module 5 — the legacy app had the add-karigar
/// screen offering Kg/Gm/Pcs/Pair while the edit screen offered those plus
/// Dozen/Meter/Litre (documents/map.md Module 3); reconciled here into a
/// single list used everywhere a unit picker appears.
const tradeUnits = <String>['Kg', 'Gm', 'Pcs', 'Pair', 'Dozen', 'Meter', 'Litre', 'Box', 'Set'];
