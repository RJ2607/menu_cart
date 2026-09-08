import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_update_cart_quantity_action.g.dart';

@JsonSerializable()
class StUpdateCartQuantityAction extends StacAction {
  /// Cart item index (can be a string placeholder like "{{index}}" in templates)
  final dynamic index;
  
  /// Quantity to set (can be a string placeholder)
  /// Special values when used in templates:
  /// - positive number: absolute quantity
  /// - negative number: relative decrement
  /// - 0: remove item
  final dynamic quantity;

  const StUpdateCartQuantityAction({
    required this.index,
    required this.quantity,
  });

  @override
  String get actionType => 'update_cart_quantity';

  factory StUpdateCartQuantityAction.fromJson(Map<String, dynamic> json) =>
      _$StUpdateCartQuantityActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StUpdateCartQuantityActionToJson(this);
}
