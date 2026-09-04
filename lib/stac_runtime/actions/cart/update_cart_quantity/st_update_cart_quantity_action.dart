import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_update_cart_quantity_action.g.dart';

@JsonSerializable()
class StUpdateCartQuantityAction extends StacAction {
  final int index;
  final int quantity;

  const StUpdateCartQuantityAction({
    required this.index,
    required this.quantity,
  });

  @override
  String get type => 'update_cart_quantity';

  factory StUpdateCartQuantityAction.fromJson(Map<String, dynamic> json) =>
      _$StUpdateCartQuantityActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StUpdateCartQuantityActionToJson(this);
}
