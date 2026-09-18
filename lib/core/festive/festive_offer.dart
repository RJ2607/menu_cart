/// Festive offer model (app-layer, not a StacWidget).
///
/// HOW TO ADD A NEW FESTIVAL IN FUTURE:
/// 1. Open `festive_offers.dart` and add one `FestiveOffer(...)` entry with a
///    unique [key] (this key is also the wildcard_page child key).
/// 2. Pick [discountType]:
///    - [FestiveDiscountType.percent] -> [value] is % off (e.g. 40 = 40% off).
///    - [FestiveDiscountType.flat] -> [value] is a flat amount off in
///      [currencySymbol] units (e.g. 500 = Rs 500 off).
/// 3. Set [minOrderSubtotal] (food subtotal needed to unlock) and
///    [currencySymbol] ('₹' etc.).
/// 4. Add the matching wildcard child + home card in `stac/lib/` and rebuild
///    (`stac build` + regenerate pitch JSON). Cart, totals, checkout dialog
///    and the festive offer bar pick the new festival up automatically —
///    no parser/controller changes needed.
library;

enum FestiveDiscountType { percent, flat }

class FestiveOffer {
  final String key;
  final String name;
  final String code;
  final FestiveDiscountType discountType;
  final double value;
  final double minOrderSubtotal;
  final String currencySymbol;

  /// Theme hooks used by the festive offer bar / checkout dialog.
  final String themeColor;
  final String accentColor;

  /// Short UI label, e.g. "40% OFF" or "Rs 500 OFF".
  final String badgeLabel;

  const FestiveOffer({
    required this.key,
    required this.name,
    required this.code,
    required this.discountType,
    required this.value,
    required this.minOrderSubtotal,
    required this.currencySymbol,
    required this.themeColor,
    required this.accentColor,
    required this.badgeLabel,
  });

  bool isEligible(double subtotal) => subtotal >= minOrderSubtotal;

  /// Discount for [subtotal]; 0 when below [minOrderSubtotal].
  /// Flat discounts are capped at subtotal so totals never go negative.
  /// Percent discounts scale with the food subtotal.
  /// UI (cart rows, offer bar, checkout dialog, pitch JSON) must call this —
  /// never re-implement percent-vs-flat math — so a future festival only
  /// needs `discountType + value + minOrderSubtotal` in `festive_offers.dart`.
  double discountFor(double subtotal) {
    if (!isEligible(subtotal)) return 0;
    switch (discountType) {
      case FestiveDiscountType.percent:
        return subtotal * (value / 100);
      case FestiveDiscountType.flat:
        return value.clamp(0, subtotal);
    }
  }

  /// One-line savings preview for any cart subtotal, e.g. "Save ₹500" or
  /// "Save ₹200.00". Returns '' when locked so UI can show the unlock hint.
  String savingsPreview(double subtotal) {
    final d = discountFor(subtotal);
    if (d <= 0) return '';
    return 'Save ${formatAmount(d)}';
  }

  /// Unlock hint, e.g. "Add ₹250 more to unlock (min ₹499)".
  String unlockHint(double subtotal) {
    final diff = minOrderSubtotal - subtotal;
    if (diff <= 0) return '';
    return 'Add ${formatAmount(diff)} more to unlock (min ${formatAmount(minOrderSubtotal)})';
  }

  String formatAmount(double amount) =>
      '$currencySymbol${amount.toStringAsFixed(discountType == FestiveDiscountType.flat ? 0 : 2)}';

  String get minOrderLabel =>
      'on orders above $currencySymbol${minOrderSubtotal.toStringAsFixed(minOrderSubtotal % 1 == 0 ? 0 : 2)}';

  String amountOffLabel() {
    switch (discountType) {
      case FestiveDiscountType.percent:
        return '${value.toStringAsFixed(value % 1 == 0 ? 0 : 1)}% off';
      case FestiveDiscountType.flat:
        return '$currencySymbol${value.toStringAsFixed(value % 1 == 0 ? 0 : 2)} off';
    }
  }
}
