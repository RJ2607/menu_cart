import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../core/controllers/item_selection_controller.dart';
import 'st_add_to_cart_button.dart';

/// Parses the "st_add_to_cart_button" Stac widget type.
/// This button reads the current selections from ItemSelectionController
/// and adds the item to cart using CartController.
class AddToCartButtonParser extends StacParser<AddToCartButton> {
  @override
  String get type => 'st_add_to_cart_button';

  @override
  AddToCartButton getModel(Map<String, dynamic> json) => AddToCartButton.fromJson(json);

  @override
  Widget parse(BuildContext context, AddToCartButton model) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final itemController = Get.find<ItemSelectionController>(tag: model.stateKey);
          final cartController = Get.find<CartController>();
          
          cartController.addToCart(
            id: model.itemId,
            name: model.itemName,
            imageUrl: model.itemImageUrl,
            basePrice: model.itemBasePrice,
            size: itemController.selectedSize.value,
            addons: List.from(itemController.selectedAddons),
          );
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${model.itemName} added to cart!'),
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xFFFF6B35),
              behavior: SnackBarBehavior.floating,
            ),
          );
          
          Navigator.of(context).pushNamed('cart');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          model.buttonText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
