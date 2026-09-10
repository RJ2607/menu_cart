import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/item_selection_controller.dart';
import 'package:stac/stac.dart';

import 'st_select_item_size_action.dart';

class StSelectItemSizeActionParser
    extends StacActionParser<StSelectItemSizeAction> {
  @override
  String get actionType => 'select_item_size';

  @override
  StSelectItemSizeAction getModel(Map<String, dynamic> json) =>
      StSelectItemSizeAction.fromJson(json);

  @override
  Future<void> onCall(
    BuildContext context,
    StSelectItemSizeAction model,
  ) async {
    Get.find<ItemSelectionController>(
      tag: model.stateKey,
    ).selectSize(model.size);
  }
}
