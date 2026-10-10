/// 'Customer' | 'Vendor' — replaces the legacy `traders.st` (1/2) integer
/// flag (documents/map.md Module 5) with a readable enum.
enum TraderType {
  customer('Customer', 'Sundry Debtor', 'CUST'),
  vendor('Vendor', 'Sundry Creditor', 'VEND');

  const TraderType(this.label, this.ledgerAccountType, this.codePrefix);
  final String label;
  final String ledgerAccountType;
  final String codePrefix;
}

enum PaymentStatus {
  pending('Pending'),
  paid('Paid'),
  partial('Partial');

  const PaymentStatus(this.value);
  final String value;

  static PaymentStatus fromValue(String v) =>
      PaymentStatus.values.firstWhere((e) => e.value == v, orElse: () => PaymentStatus.pending);
}

/// One line item entered on the Add Sale / Add Procurement form, before
/// it's persisted — kept as a plain input model distinct from the drift
/// row type.
class TradeLineItemInput {
  TradeLineItemInput({
    required this.productId,
    required this.productName,
    required this.unit,
    required this.qty,
    required this.priceOfProduct,
  });

  final int productId;
  final String productName;
  final String unit;
  final double qty;
  final double priceOfProduct;

  double get taxableValue => qty * priceOfProduct;
}

class TradeRepositoryException implements Exception {
  TradeRepositoryException(this.message);
  final String message;
  @override
  String toString() => message;
}
