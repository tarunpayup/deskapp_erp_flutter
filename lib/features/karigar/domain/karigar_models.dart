/// 'Advance' | 'Payable' — a karigar's opening balance direction
/// (documents/map.md Module 3 rule #4). Positive running balance = firm
/// owes karigar (Payable); negative = karigar owes firm (Advance).
enum BalanceType {
  advance('Advance'),
  payable('Payable');

  const BalanceType(this.value);
  final String value;

  static BalanceType fromValue(String v) =>
      BalanceType.values.firstWhere((e) => e.value == v, orElse: () => BalanceType.payable);

  /// Signed opening balance: Payable is positive (firm owes karigar),
  /// Advance is negative (karigar owes firm) — same sign convention as
  /// the running balance (rule #4).
  double signedAmount(double amount) => this == BalanceType.advance ? -amount.abs() : amount.abs();
}

/// 'Open' | 'Completed' — a job-work lot's lifecycle status (rule #1).
enum JobWorkStatus {
  open('Open'),
  completed('Completed');

  const JobWorkStatus(this.value);
  final String value;
}

/// Epsilon for float comparisons when checking `quantityRec >= quantity`
/// (documents/map.md Module 3 rule #1, exact value from the legacy).
const jobWorkCompletionEpsilon = 0.0005;

/// One line item entered on the "Add Job Work" form for a multi-item lot,
/// before it's persisted.
class JobWorkLineItemInput {
  JobWorkLineItemInput({
    required this.productId,
    required this.productName,
    required this.unit,
    required this.rate,
    required this.qtyAllotted,
  });

  final int productId;
  final String productName;
  final String unit;
  final double rate;
  final double qtyAllotted;
}

/// One product line's receive-now input for a multi-item receipt.
class ReceiptLineInput {
  ReceiptLineInput({required this.jobWorkLineItemId, required this.qtyReceivedNow});
  final int jobWorkLineItemId;
  final double qtyReceivedNow;
}

class KarigarRepositoryException implements Exception {
  KarigarRepositoryException(this.message);
  final String message;
  @override
  String toString() => message;
}
