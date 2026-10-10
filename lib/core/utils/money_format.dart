import 'package:intl/intl.dart';

/// Indian-digit-grouped currency formatting, replacing the legacy app's
/// several hand-rolled `indianFormat()`/`formatIndian()` JS/PHP duplicates
/// (documents/map.md Module 4/5 cross-cutting notes) with Dart's locale-
/// aware `intl` package.
abstract class MoneyFormat {
  static final _indian = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );
  static final _indianPlain = NumberFormat.decimalPatternDigits(
    locale: 'en_IN',
    decimalDigits: 2,
  );

  /// e.g. ₹1,10,05,628.05
  static String currency(double value) => _indian.format(value);

  /// e.g. 1,10,05,628.05 (no symbol)
  static String plain(double value) => _indianPlain.format(value.abs());

  /// e.g. "1,10,05,628.05 Dr" / "90,000.00 Cr" — positive=Dr convention
  /// (documents/map.md Module 4 rule #1).
  static String withDrCr(double value) {
    final suffix = value >= 0 ? 'Dr' : 'Cr';
    return '${plain(value)} $suffix';
  }
}
