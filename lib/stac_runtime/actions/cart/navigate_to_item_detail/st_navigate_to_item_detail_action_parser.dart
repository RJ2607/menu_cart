import 'package:flutter/material.dart';
import 'package:menu_cart/core/controllers/cart_controller.dart';
import 'package:menu_cart/utils/console_logger.dart';
import 'package:stac/stac.dart';

import 'st_navigate_to_item_detail_action.dart';

/// Parses and dispatches [StNavigateToItemDetailAction].
class StNavigateToItemDetailActionParser
    extends StacActionParser<StNavigateToItemDetailAction> {
  const StNavigateToItemDetailActionParser();

  @override
  String get actionType => 'navigate_to_item_detail';

  @override
  StNavigateToItemDetailAction getModel(Map<String, dynamic> json) =>
      StNavigateToItemDetailAction.fromJson(json);

  @override
  Future<void> onCall(
    BuildContext context,
    StNavigateToItemDetailAction model,
  ) async {
    ConsoleLogger.info('itemId: ${model.itemId}');
    final controller = CartController.to;
    controller.setSelectedItemId(model.itemId);
    final navigateAction = StacNavigateAction(
      navigationStyle: NavigationStyle.push,
      routeName: 'item_detail',
      arguments: {'itemId': model.itemId},
    );
    await Stac.onCallFromJson(navigateAction.toJson(), context);
  }
}
