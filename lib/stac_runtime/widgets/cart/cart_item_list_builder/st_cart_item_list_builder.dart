import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_cart_item_list_builder.g.dart';

/// A template-based cart items list widget that renders cart items from CartController.
/// 
/// Each cart item is rendered using [itemTemplate] with placeholder substitution:
/// - {{index}} - cart item index (0-based)
/// - {{id}} - item id
/// - {{name}} - item name
/// - {{imageUrl}} - item image URL
/// - {{basePrice}} - base price per unit
/// - {{itemPrice}} - calculated price per unit (including size/addons)
/// - {{quantity}} - item quantity
/// - {{totalPrice}} - total price (itemPrice * quantity)
/// - {{optionsText}} - formatted options (e.g., "Large, Extra Cheese")
/// - {{selectedSize}} - selected size
/// - {{selectedAddons}} - comma-separated addons
///
/// Example usage:
/// ```dart
/// StCartItemListBuilder(
///   itemTemplate: StDismissible(
///     keyValue: 'cart-{{index}}',
///     child: StacContainer(
///       child: StacRow(
///         children: [
///           StacImage.network('{{imageUrl}}'),
///           StacText(data: '{{name}}'),
///           StacText(data: '\${{totalPrice}}'),
///         ],
///       ),
///     ),
///   ),
///   emptyWidget: StacText(data: 'Your cart is empty'),
/// )
/// ```
@JsonSerializable(explicitToJson: true)
class StCartItemListBuilder extends StacWidget {
  /// StacWidget template rendered for each cart item.
  /// Placeholders like {{name}}, {{price}}, {{quantity}} are replaced with actual values.
  final StacWidget itemTemplate;

  /// Widget shown when cart is empty
  final StacWidget? emptyWidget;

  /// Optional spacing between items (in pixels)
  final double? spacing;

  /// Optional header template text (e.g., "{{count}} {{label}} in cart")
  /// Available placeholders: {{count}}, {{label}}
  final String? headerText;

  /// Singular form for count (default: "item")
  final String? itemSingular;

  /// Plural form for count (default: "items")
  final String? itemPlural;

  const StCartItemListBuilder({
    required this.itemTemplate,
    this.emptyWidget,
    this.spacing,
    this.headerText,
    this.itemSingular,
    this.itemPlural,
  });

  @override
  String get type => 'cart_item_list_builder';

  factory StCartItemListBuilder.fromJson(Map<String, dynamic> json) =>
      _$StCartItemListBuilderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartItemListBuilderToJson(this);
}
