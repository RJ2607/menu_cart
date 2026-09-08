import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_menu_item_list_builder.g.dart';

/// Template-based menu items list widget that filters by category.
/// 
/// Observes CartController.selectedCategory and dynamically renders items
/// matching the selected category using the provided itemTemplate.
/// 
/// Available placeholders in itemTemplate:
/// - {{id}} - item id
/// - {{name}} - item name
/// - {{description}} - item description
/// - {{category}} - item category
/// - {{price}} - item price
/// - {{imageUrl}} - item image URL
/// - {{isVegetarian}} - true/false
/// - {{isAvailable}} - true/false
/// - {{index}} - item index within filtered list
@JsonSerializable(explicitToJson: true)
class StMenuItemListBuilder extends StacWidget {
  /// Menu records supplied by the screen JSON or a server payload.
  final List<Map<String, dynamic>> items;

  /// StacWidget template rendered for each menu item.
  /// Placeholders like {{name}}, {{price}}, {{imageUrl}} are replaced with actual values.
  final StacWidget itemTemplate;

  /// Optional section header template (e.g., "{{category}} Items")
  /// Available placeholders: {{category}}, {{count}}
  final String? sectionHeaderTemplate;

  /// Optional widget shown when no items match the selected category
  final StacWidget? emptyWidget;

  /// Optional spacing between items
  final double? spacing;

  const StMenuItemListBuilder({
    required this.items,
    required this.itemTemplate,
    this.sectionHeaderTemplate,
    this.emptyWidget,
    this.spacing,
  });

  @override
  String get type => 'menu_item_list_builder';

  factory StMenuItemListBuilder.fromJson(Map<String, dynamic> json) =>
      _$StMenuItemListBuilderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StMenuItemListBuilderToJson(this);
}
