/// Dr/Cr transaction direction, matching the legacy `dc`/`dc_current`
/// convention (1=Debit, 2=Credit) — documents/map.md Module 4 rule #1.
enum DrCr {
  debit(1),
  credit(2);

  const DrCr(this.code);
  final int code;

  static DrCr fromCode(int code) => code == 2 ? DrCr.credit : DrCr.debit;
  static DrCr fromSign(double value) => value >= 0 ? DrCr.debit : DrCr.credit;

  String get label => this == DrCr.debit ? 'Dr' : 'Cr';
}

enum LedgerStatus {
  active('Active'),
  notActive('Not Active');

  const LedgerStatus(this.value);
  final String value;
}

/// Cash voucher direction — legacy `transaction_type` 1=Receive(In)/2=Pay(Out).
enum CashDirection {
  receive(1),
  pay(2);

  const CashDirection(this.code);
  final int code;
}

/// Bank voucher direction — legacy `transaction_type` 1=Deposit/2=Withdrawal.
enum BankDirection {
  deposit(1),
  withdrawal(2);

  const BankDirection(this.code);
  final int code;
}

/// One resolved line in a ledger statement / bank-entries view, after the
/// correct chronological running-balance computation (Module 4 rule #4).
class StatementLine {
  const StatementLine({
    required this.entryId,
    required this.voucherType,
    required this.voucherNo,
    required this.date,
    required this.narration,
    required this.debit,
    required this.credit,
    required this.runningBalance,
    required this.otherAccountName,
  });

  final int entryId;
  final String voucherType;
  final String voucherNo;
  final DateTime date;
  final String? narration;
  final double debit;
  final double credit;
  final double runningBalance;
  final String? otherAccountName;
}

class TrialBalanceGroup {
  const TrialBalanceGroup({
    required this.accountType,
    required this.rows,
  });

  final String accountType;
  final List<TrialBalanceRow> rows;

  double get totalDebit =>
      rows.fold(0, (sum, r) => sum + (r.balance >= 0 ? r.balance : 0));
  double get totalCredit =>
      rows.fold(0, (sum, r) => sum + (r.balance < 0 ? -r.balance : 0));
}

class TrialBalanceRow {
  const TrialBalanceRow({
    required this.lid,
    required this.accountName,
    required this.balance,
  });

  final int lid;
  final String accountName;
  final double balance;
}

class LedgerRepositoryException implements Exception {
  LedgerRepositoryException(this.message);
  final String message;
  @override
  String toString() => message;
}
