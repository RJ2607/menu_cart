import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_navigate_to_item_detail_action.g.dart';

/// Custom [StacAction] for navigating to item detail screen with item ID.
@JsonSerializable(explicitToJson: true)
class StNavigateToItemDetailAction extends StacAction {
  final String itemId;

  const StNavigateToItemDetailAction({required this.itemId});

  @override
  String get actionType => 'navigate_to_item_detail';

  factory StNavigateToItemDetailAction.fromJson(Map<String, dynamic> json) =>
      _$StNavigateToItemDetailActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StNavigateToItemDetailActionToJson(this);
}
