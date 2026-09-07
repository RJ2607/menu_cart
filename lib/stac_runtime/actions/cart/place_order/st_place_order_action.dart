import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_place_order_action.g.dart';

/// Custom [StacAction] for the "place_order" action type.
@JsonSerializable(explicitToJson: true)
class StPlaceOrderAction extends StacAction {
  const StPlaceOrderAction();

  @override
  String get actionType => 'place_order';

  factory StPlaceOrderAction.fromJson(Map<String, dynamic> json) =>
      _$StPlaceOrderActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StPlaceOrderActionToJson(this);
}
