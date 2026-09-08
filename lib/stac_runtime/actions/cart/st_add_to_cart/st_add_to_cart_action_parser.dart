import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/app/app_nav.dart';
import 'package:menu_cart/core/controllers/cart_controller.dart';
import 'package:menu_cart/core/controllers/item_selection_controller.dart';
import 'package:menu_cart/utils/console_logger.dart';
import 'package:stac/stac.dart';

import 'st_add_to_cart_action.dart';

/// Parses and dispatches [StAddToCartAction].
class StAddToCartActionParser extends StacActionParser<StAddToCartAction> {
  @override
  String get actionType => 'st_add_to_cart';

  @override
  StAddToCartAction getModel(Map<String, dynamic> json) =>
      StAddToCartAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StAddToCartAction model) async {
    final itemController = Get.find<ItemSelectionController>(
      tag: model.stateKey,
    );
    final cartController = Get.find<CartController>();

    ConsoleLogger.info('id: ${model.itemId}');
    ConsoleLogger.info('name: ${model.itemName}');
    ConsoleLogger.info('imageUrl: ${model.itemImageUrl}');
    ConsoleLogger.info('basePrice: ${model.itemBasePrice}');
    ConsoleLogger.info('size: ${itemController.selectedSize.value}');
    ConsoleLogger.info('addons: ${itemController.selectedAddons}');

    cartController.addToCart(
      id: model.itemId,
      name: model.itemName,
      imageUrl: model.itemImageUrl,
      basePrice: model.itemBasePrice is num
          ? (model.itemBasePrice as num).toDouble()
          : double.tryParse(model.itemBasePrice.toString()) ?? 0,
      size: itemController.selectedSize.value,
      addons: List.from(itemController.selectedAddons),
    );

    StacSnackBarAction(
      label: '${model.itemName} added to cart!',
      onPressed: StacAction(),
    );

    await AppNav.pushReplacementStac(context, 'cart');
  }
}
