import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_add_to_cart_action.g.dart';

/// Custom [StacAction] for the "st_add_to_cart" action type.
@JsonSerializable()
class StAddToCartAction extends StacAction {
  const StAddToCartAction({
    required this.stateKey,
    required this.itemId,
    required this.itemName,
    required this.itemImageUrl,
    required this.itemBasePrice,
  });

  final String stateKey;
  final String itemId;
  final String itemName;
  final String itemImageUrl;
  final dynamic itemBasePrice;

  @override
  String get actionType => 'st_add_to_cart';

  factory StAddToCartAction.fromJson(Map<String, dynamic> json) =>
      _$StAddToCartActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StAddToCartActionToJson(this);
}
