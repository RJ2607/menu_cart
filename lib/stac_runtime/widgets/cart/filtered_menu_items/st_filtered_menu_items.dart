import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_filtered_menu_items.g.dart';

@JsonSerializable(explicitToJson: true)
class FilteredMenuItems extends StacWidget {
  const FilteredMenuItems({this.child});

  final StacWidget? child;

  @override
  String get type => 'filtered_menu_items';

  factory FilteredMenuItems.fromJson(Map<String, dynamic> json) =>
      _$FilteredMenuItemsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FilteredMenuItemsToJson(this);
}
