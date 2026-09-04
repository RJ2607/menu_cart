import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/cart_controller.dart';
import 'st_set_category_action.dart';

class StSetCategoryActionParser extends StacActionParser<StSetCategoryAction> {
  @override
  String get actionType => 'set_category';

  @override
  StSetCategoryAction getModel(Map<String, dynamic> json) =>
      StSetCategoryAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StSetCategoryAction model) async {
    final controller = Get.find<CartController>();
    controller.setCategory(model.category);
  }
}
