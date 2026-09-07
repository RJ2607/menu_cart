import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_quantity_control.g.dart';

/// Data model for the "st_quantity_control" Stac widget type.
/// Displays increment/decrement buttons for cart item quantity.
@JsonSerializable(explicitToJson: true)
class QuantityControl extends StacWidget {
  final int cartItemIndex;
  final int currentQuantity;

  const QuantityControl({
    required this.cartItemIndex,
    required this.currentQuantity,
  });

  @override
  String get type => 'st_quantity_control';

  factory QuantityControl.fromJson(Map<String, dynamic> json) =>
      _$QuantityControlFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuantityControlToJson(this);
}
