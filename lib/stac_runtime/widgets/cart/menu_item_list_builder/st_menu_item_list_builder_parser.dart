import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../enums/st_enums/st_curves.dart';
import '../../../../utils/money.dart';
import '../../layout/animation_config/st_animation.dart';
import '../../layout/animation_config/st_animation_config.dart';
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
      final selectedCategory = controller.selectedCategory.value;
      final filteredItems = selectedCategory == 'All'
          ? model.items
          : model.items
                .where((item) => item['category'] == selectedCategory)
                .toList();
      final transitionAnimation =
          model.categoryTransitionAnimation ??
          const StacAnimationConfig(
            durationMs: 260,
            curve: StCurves.easeOutCubic,
            outCurve: StCurves.easeInCubic,
            offsetBeginY: 0.04,
          );
      if (filteredItems.isEmpty) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: transitionAnimation.durationMs),
          switchInCurve: stAnimationCurve(transitionAnimation.curve),
          switchOutCurve: stAnimationCurve(transitionAnimation.outCurve),
          transitionBuilder: (child, value) =>
              stSwitchTransition(child, value, transitionAnimation),
          child: KeyedSubtree(
            key: ValueKey('empty-$selectedCategory'),
            child: model.emptyWidget == null
                ? const SizedBox.shrink()
                : Stac.fromJson(model.emptyWidget!.toJson(), context) ??
                      const SizedBox.shrink(),
          ),
        );
      }
      final itemWidgets = <Widget>[];
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
        for (int i = 0; i < filteredItems.length; i++) {
          final item = filteredItems[i];
          itemWidgets.add(_buildItem(context, model, item, i));

          if (i < filteredItems.length - 1 && model.spacing != null) {
            itemWidgets.add(SizedBox(height: model.spacing));
          }
        }
      }

      return AnimatedSwitcher(
        duration: Duration(milliseconds: transitionAnimation.durationMs),
        switchInCurve: stAnimationCurve(transitionAnimation.curve),
        switchOutCurve: stAnimationCurve(transitionAnimation.outCurve),
        transitionBuilder: (child, value) =>
            stSwitchTransition(child, value, transitionAnimation),
        child: KeyedSubtree(
          key: ValueKey('menu-category-$selectedCategory'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: itemWidgets,
          ),
        ),
      );
    });
  }

  Widget _buildItem(
    BuildContext context,
    StMenuItemListBuilder model,
    Map<String, dynamic> item,
    int index,
  ) {
    final placeholders = <String, String>{
      'index': index.toString(),
      for (final entry in item.entries)
        entry.key: entry.value is num
            ? inrNum(entry.value as num)
            : entry.value?.toString() ?? '',
    };

    final templateJson = _replacePlaceholders(
      model.itemTemplate.toJson(),
      placeholders,
    );

    return Stac.fromJson(templateJson, context) ?? const SizedBox.shrink();
  }

  dynamic _replacePlaceholders(dynamic json, Map<String, String> placeholders) {
    if (json is String) {
      String result = json;
      placeholders.forEach((key, value) {
        result = result.replaceAll('{{$key}}', value);
      });
      return result;
    } else if (json is Map) {
      final result = <String, dynamic>{};
      json.forEach((key, value) {
        result[key.toString()] = _replacePlaceholders(value, placeholders);
      });
      return result;
    } else if (json is List) {
      return json
          .map((item) => _replacePlaceholders(item, placeholders))
          .toList();
    }
    return json;
  }
}
