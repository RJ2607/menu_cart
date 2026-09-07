import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_dynamic_cart_summary.g.dart';

/// Data model for the "st_dynamic_cart_summary" Stac widget type.
/// Displays order summary with reactive totals from CartController.
@JsonSerializable(explicitToJson: true)
class DynamicCartSummary extends StacWidget {
  const DynamicCartSummary();

  @override
  String get type => 'st_dynamic_cart_summary';

  factory DynamicCartSummary.fromJson(Map<String, dynamic> json) =>
      _$DynamicCartSummaryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DynamicCartSummaryToJson(this);
}
