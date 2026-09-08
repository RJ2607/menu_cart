import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_cart_summary_builder.g.dart';

/// A charge line item in the cart summary
@JsonSerializable(explicitToJson: true)
class ChargeItem {
  /// Label for the charge (e.g., "Subtotal", "Delivery Fee")
  final String label;

  /// Controller field name to read the value from (e.g., "subtotal", "deliveryFee", "total")
  final String valueKey;

  /// Optional text color (hex string like "#FF6B35")
  final String? color;

  /// Optional font size
  final double? fontSize;

  /// Optional font weight ("w400", "w600", "w700")
  final String? fontWeight;

  /// If true, this is the total row (may have different styling)
  final bool isTotal;

  const ChargeItem({
    required this.label,
    required this.valueKey,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isTotal = false,
  });

  factory ChargeItem.fromJson(Map<String, dynamic> json) =>
      _$ChargeItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeItemToJson(this);
}

/// A template-based cart summary widget that displays charges and action button.
/// 
/// Renders charge line items from CartController using [chargeItems] configuration.
/// Each charge item reads its value from the controller using [valueKey]:
/// - "subtotal" - sum of all item totals
/// - "deliveryFee" - delivery fee amount
/// - "total" - subtotal + deliveryFee
/// 
/// Example usage:
/// ```dart
/// StCartSummaryBuilder(
///   chargeItems: [
///     ChargeItem(label: 'Subtotal', valueKey: 'subtotal'),
///     ChargeItem(label: 'Delivery Fee', valueKey: 'deliveryFee'),
///     ChargeItem(
///       label: 'Total',
///       valueKey: 'total',
///       isTotal: true,
///       fontSize: 24,
///       fontWeight: 'w700',
///       color: '#FF6B35',
///     ),
///   ],
///   actionButton: StMainButton(
///     title: 'Place Order',
///     onPressed: StPlaceOrderAction(),
///   ),
/// )
/// ```
@JsonSerializable(explicitToJson: true)
class StCartSummaryBuilder extends StacWidget {
  /// List of charge line items to display
  final List<ChargeItem> chargeItems;

  /// Optional action button widget (e.g., "Place Order" button)
  final StacWidget? actionButton;

  /// Background color (hex string)
  final String? backgroundColor;

  /// Border top radius
  final double? borderTopRadius;

  /// Container padding
  final double? padding;

  /// Spacing between charge rows
  final double? rowSpacing;

  /// Show divider before total row
  final bool showDivider;

  /// Divider color
  final String? dividerColor;

  const StCartSummaryBuilder({
    required this.chargeItems,
    this.actionButton,
    this.backgroundColor,
    this.borderTopRadius,
    this.padding,
    this.rowSpacing,
    this.showDivider = true,
    this.dividerColor,
  });

  @override
  String get type => 'cart_summary_builder';

  factory StCartSummaryBuilder.fromJson(Map<String, dynamic> json) =>
      _$StCartSummaryBuilderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartSummaryBuilderToJson(this);
}
