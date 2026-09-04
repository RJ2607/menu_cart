import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_toggle_favorite_action.g.dart';

@JsonSerializable()
class StToggleFavoriteAction extends StacAction {
  final String itemId;

  const StToggleFavoriteAction({
    required this.itemId,
  });

  @override
  String get type => 'toggle_favorite';

  factory StToggleFavoriteAction.fromJson(Map<String, dynamic> json) =>
      _$StToggleFavoriteActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StToggleFavoriteActionToJson(this);
}
