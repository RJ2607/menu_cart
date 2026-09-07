import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
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
    final controller = Get.find<CartController>();
    controller.setSelectedItemId(model.itemId);
    Navigator.of(context).pushNamed('item_detail');
  }
}
