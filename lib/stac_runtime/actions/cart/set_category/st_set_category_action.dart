import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_set_category_action.g.dart';

@JsonSerializable()
class StSetCategoryAction extends StacAction {
  final String category;

  const StSetCategoryAction({
    required this.category,
  });

  @override
  String get type => 'set_category';

  factory StSetCategoryAction.fromJson(Map<String, dynamic> json) =>
      _$StSetCategoryActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StSetCategoryActionToJson(this);
}
