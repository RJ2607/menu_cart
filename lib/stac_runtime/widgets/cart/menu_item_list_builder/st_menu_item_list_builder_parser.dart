import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_menu_item_list_builder.dart';

/// Parser for StMenuItemListBuilder that renders menu items filtered by category.
class StMenuItemListBuilderParser extends StacParser<StMenuItemListBuilder> {
  const StMenuItemListBuilderParser();

  @override
  String get type => 'menu_item_list_builder';

  @override
  StMenuItemListBuilder getModel(Map<String, dynamic> json) =>
      StMenuItemListBuilder.fromJson(json);

  @override
  Widget parse(BuildContext context, StMenuItemListBuilder model) {
    final controller = Get.find<CartController>();

    return Obx(() {
      // Get selected category
      final selectedCategory = controller.selectedCategory.value;

      // Filter items by selected category
      final filteredItems = selectedCategory == 'All'
          ? model.items
          : model.items
                .where((item) => item['category'] == selectedCategory)
                .toList();

      // Show empty widget if no items match
      if (filteredItems.isEmpty) {
        if (model.emptyWidget != null) {
          return Stac.fromJson(model.emptyWidget!.toJson(), context) ??
              const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      }

      // Build items list
      final itemWidgets = <Widget>[];

      // Group items by category if "All" is selected
      if (selectedCategory == 'All') {
        final categoryOrder = <String>[];
        for (final item in filteredItems) {
          final category = item['category']?.toString() ?? '';
          if (category.isNotEmpty && !categoryOrder.contains(category)) {
            categoryOrder.add(category);
          }
        }

        for (final category in categoryOrder) {
          final categoryItems = filteredItems
              .where((item) => item['category'] == category)
              .toList();

          if (categoryItems.isNotEmpty) {
            // Add section header if template provided
            if (model.sectionHeaderTemplate != null) {
              final headerText = model.sectionHeaderTemplate!
                  .replaceAll('{{category}}', category)
                  .replaceAll('{{count}}', categoryItems.length.toString());

              itemWidgets.add(
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                  child: Text(
                    headerText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D3436),
                    ),
                  ),
                ),
              );
            }

            // Add items for this category
            for (int i = 0; i < categoryItems.length; i++) {
              final item = categoryItems[i];
              itemWidgets.add(_buildItem(context, model, item, i));

              if (i < categoryItems.length - 1 && model.spacing != null) {
                itemWidgets.add(SizedBox(height: model.spacing));
              }
            }

            if (category != categoryOrder.last) {
              itemWidgets.add(const SizedBox(height: 16));
            }
          }
        }
      } else {
        // Single category selected - render all items
        for (int i = 0; i < filteredItems.length; i++) {
          final item = filteredItems[i];
          itemWidgets.add(_buildItem(context, model, item, i));

          if (i < filteredItems.length - 1 && model.spacing != null) {
            itemWidgets.add(SizedBox(height: model.spacing));
          }
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemWidgets,
      );
    });
  }

  Widget _buildItem(
    BuildContext context,
    StMenuItemListBuilder model,
    Map<String, dynamic> item,
    int index,
  ) {
    // Create placeholder map for this item
    final placeholders = <String, String>{
      'index': index.toString(),
      for (final entry in item.entries)
        entry.key: entry.value is num
            ? (entry.value as num).toStringAsFixed(2)
            : entry.value?.toString() ?? '',
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
