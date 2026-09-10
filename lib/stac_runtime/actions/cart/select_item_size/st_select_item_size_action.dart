import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_select_item_size_action.g.dart';

@JsonSerializable()
class StSelectItemSizeAction extends StacAction {
  const StSelectItemSizeAction({required this.stateKey, required this.size});

  final String stateKey;
  final String size;

  @override
  String get actionType => 'select_item_size';

  factory StSelectItemSizeAction.fromJson(Map<String, dynamic> json) =>
      _$StSelectItemSizeActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StSelectItemSizeActionToJson(this);
}
