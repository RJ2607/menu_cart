import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_toggle_item_addon_action.g.dart';

@JsonSerializable()
class StToggleItemAddonAction extends StacAction {
  const StToggleItemAddonAction({required this.stateKey, required this.addon});

  final String stateKey;
  final String addon;

  @override
  String get actionType => 'toggle_item_addon';

  factory StToggleItemAddonAction.fromJson(Map<String, dynamic> json) =>
      _$StToggleItemAddonActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StToggleItemAddonActionToJson(this);
}
