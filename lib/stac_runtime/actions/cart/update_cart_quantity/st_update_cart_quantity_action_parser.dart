import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/cart_controller.dart';
import 'st_update_cart_quantity_action.dart';

class StUpdateCartQuantityActionParser extends StacActionParser<StUpdateCartQuantityAction> {
  @override
  String get actionType => 'update_cart_quantity';

  @override
  StUpdateCartQuantityAction getModel(Map<String, dynamic> json) =>
      StUpdateCartQuantityAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StUpdateCartQuantityAction model) async {
    final controller = Get.find<CartController>();
    controller.updateQuantity(model.index, model.quantity);
  }
}
