import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_cart_item_list_builder.dart';

/// Parser for StCartItemListBuilder that renders cart items using a template.
class StCartItemListBuilderParser extends StacParser<StCartItemListBuilder> {
  const StCartItemListBuilderParser();

  @override
  String get type => 'cart_item_list_builder';

  @override
  StCartItemListBuilder getModel(Map<String, dynamic> json) =>
      StCartItemListBuilder.fromJson(json);

  @override
  Widget parse(BuildContext context, StCartItemListBuilder model) {
    final controller = CartController.to;

    return Obx(() {
      final cartItems = controller.cartItems;

      // Show empty widget if cart is empty
      if (cartItems.isEmpty) {
        if (model.emptyWidget != null) {
          return Stac.fromJson(model.emptyWidget!.toJson(), context) ??
              const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      }

      // Build header if template provided
      final headerWidget = model.headerText != null
          ? _buildHeader(context, model, cartItems.length)
          : null;

      // Build item list
      final itemWidgets = <Widget>[];
      for (int i = 0; i < cartItems.length; i++) {
        final item = cartItems[i];
        final itemWidget = _buildItem(context, model, item, i);
        itemWidgets.add(itemWidget);

        // Add spacing between items (except after last item)
        if (i < cartItems.length - 1 && model.spacing != null) {
          itemWidgets.add(SizedBox(height: model.spacing));
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headerWidget != null) ...[
            headerWidget,
            SizedBox(height: model.spacing ?? 16),
          ],
          ...itemWidgets,
        ],
      );
    });
  }

  Widget? _buildHeader(
    BuildContext context,
    StCartItemListBuilder model,
    int count,
  ) {
    if (model.headerText == null) return null;

    final singular = model.itemSingular ?? 'item';
    final plural = model.itemPlural ?? 'items';
    final label = count == 1 ? singular : plural;

    final headerText = model.headerText!
        .replaceAll('{{count}}', count.toString())
        .replaceAll('{{label}}', label);

    return Text(
      headerText,
      style: const TextStyle(fontSize: 14, color: Color(0xFF636E72)),
    );
  }

  Widget _buildItem(
    BuildContext context,
    StCartItemListBuilder model,
    CartItem item,
    int index,
  ) {
    // Create placeholder map for this item
    final placeholders = <String, String>{
      'index': index.toString(),
      'id': item.id,
      'name': item.name,
      'imageUrl': item.imageUrl,
      'basePrice': item.basePrice.toStringAsFixed(2),
      'itemPrice': item.itemPrice.toStringAsFixed(2),
      'quantity': item.quantity.toString(),
      'totalPrice': item.totalPrice.toStringAsFixed(2),
      'optionsText': item.optionsText,
      'selectedSize': item.selectedSize,
      'selectedAddons': item.selectedAddons.join(', '),
    };

    // Serialize template to JSON and replace placeholders
    final templateJson = _replacePlaceholders(
      model.itemTemplate.toJson(),
      placeholders,
    );

    // Parse and render the template
    return Stac.fromJson(templateJson, context) ?? const SizedBox.shrink();
  }

  /// Recursively replaces {{placeholder}} strings in JSON with actual values
  dynamic _replacePlaceholders(dynamic json, Map<String, String> placeholders) {
    if (json is String) {
      // Replace all placeholders in the string
      String result = json;
      placeholders.forEach((key, value) {
        result = result.replaceAll('{{$key}}', value);
      });
      return result;
    } else if (json is Map) {
      // Recursively replace in map values and cast to Map<String, dynamic>
      final result = <String, dynamic>{};
      json.forEach((key, value) {
        result[key.toString()] = _replacePlaceholders(value, placeholders);
      });
      return result;
    } else if (json is List) {
      // Recursively replace in list items
      return json
          .map((item) => _replacePlaceholders(item, placeholders))
          .toList();
    }
    return json;
  }
}
