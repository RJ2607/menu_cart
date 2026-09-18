/// Rupee formatting shared by cart/checkout display parsers.
///
/// Whole-rupee amounts render without decimals (₹249); paise render with two
/// decimals (₹249.50). Keeps every price row consistent app-wide.
String money(String symbol, double value) =>
    '$symbol${value.toStringAsFixed(value % 1 == 0 ? 0 : 2)}';

/// Shorthand for the app default (₹).
String inr(double value) => money('₹', value);

/// Formats a template-injected number the same way (drops trailing .00).
String inrNum(num value) =>
    value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(2);
