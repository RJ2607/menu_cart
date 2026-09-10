import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/item_selection_controller.dart';
import 'package:stac/stac.dart';

import 'st_toggle_item_addon_action.dart';

class StToggleItemAddonActionParser
    extends StacActionParser<StToggleItemAddonAction> {
  @override
  String get actionType => 'toggle_item_addon';

  @override
  StToggleItemAddonAction getModel(Map<String, dynamic> json) =>
      StToggleItemAddonAction.fromJson(json);

  @override
  Future<void> onCall(
    BuildContext context,
    StToggleItemAddonAction model,
  ) async {
    Get.find<ItemSelectionController>(
      tag: model.stateKey,
    ).toggleAddon(model.addon);
  }
}
