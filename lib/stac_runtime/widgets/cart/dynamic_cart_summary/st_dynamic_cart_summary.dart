import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_dynamic_cart_summary.g.dart';

/// Data model for the "st_dynamic_cart_summary" Stac widget type.
/// Displays order summary with reactive totals from CartController.
@JsonSerializable(explicitToJson: true)
class DynamicCartSummary extends StacWidget {
  // Labels
  final String? subtotalLabel;
  final String? deliveryLabel;
  final String? totalLabel;
  final String? placeOrderText;

  // Colors
  final String? backgroundColor;
  final String? subtotalTextColor;
  final String? subtotalValueColor;
  final String? deliveryTextColor;
  final String? deliveryValueColor;
  final String? totalTextColor;
  final String? totalValueColor;
  final String? dividerColor;
  final String? placeOrderButtonColor;
  final String? placeOrderTextColor;

  // Sizing
  final double? borderTopRadius;
  final double? verticalPadding;

  const DynamicCartSummary({
    this.subtotalLabel,
    this.deliveryLabel,
    this.totalLabel,
    this.placeOrderText,
    this.backgroundColor,
    this.subtotalTextColor,
    this.subtotalValueColor,
    this.deliveryTextColor,
    this.deliveryValueColor,
    this.totalTextColor,
    this.totalValueColor,
    this.dividerColor,
    this.placeOrderButtonColor,
    this.placeOrderTextColor,
    this.borderTopRadius,
    this.verticalPadding,
  });

  @override
  String get type => 'st_dynamic_cart_summary';

  factory DynamicCartSummary.fromJson(Map<String, dynamic> json) =>
      _$DynamicCartSummaryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DynamicCartSummaryToJson(this);
}
