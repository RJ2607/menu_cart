import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_update_cart_quantity_action.dart';

class StUpdateCartQuantityActionParser
    extends StacActionParser<StUpdateCartQuantityAction> {
  @override
  String get actionType => 'update_cart_quantity';

  @override
  StUpdateCartQuantityAction getModel(Map<String, dynamic> json) =>
      StUpdateCartQuantityAction.fromJson(json);

  @override
  Future<void> onCall(
    BuildContext context,
    StUpdateCartQuantityAction model,
  ) async {
    final controller = Get.find<CartController>();
    
    // Parse index - could be int or string from placeholder
    int index;
    if (model.index is int) {
      index = model.index as int;
    } else {
      index = int.parse(model.index.toString());
    }
    
    // Parse quantity - could be int or string from placeholder
    int quantity;
    if (model.quantity is int) {
      quantity = model.quantity as int;
    } else {
      quantity = int.parse(model.quantity.toString());
    }
    
    // Check if index is valid
    if (index < 0 || index >= controller.cartItems.length) {
      return;
    }
    
    final currentItem = controller.cartItems[index];
    
    // Handle different quantity operations:
    // - 0: remove item
    // - positive values 1-10: relative increment (add to current quantity)
    // - negative values: relative decrement (subtract from current quantity)
    // - values > 10: absolute quantity
    
    if (quantity == 0) {
      // Remove item
      controller.removeFromCart(index);
    } else if (quantity > 0 && quantity <= 10) {
      // Relative increment
      controller.updateQuantity(index, currentItem.quantity + quantity);
    } else if (quantity < 0) {
      // Relative decrement
      final newQuantity = currentItem.quantity + quantity; // quantity is negative
      if (newQuantity <= 0) {
        controller.removeFromCart(index);
      } else {
        controller.updateQuantity(index, newQuantity);
      }
    } else {
      // Absolute quantity
      controller.updateQuantity(index, quantity);
    }
  }
}
