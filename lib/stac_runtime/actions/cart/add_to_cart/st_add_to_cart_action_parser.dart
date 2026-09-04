import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/cart_controller.dart';
import 'st_add_to_cart_action.dart';

class StAddToCartActionParser extends StacActionParser<StAddToCartAction> {
  @override
  String get actionType => 'add_to_cart';

  @override
  StAddToCartAction getModel(Map<String, dynamic> json) =>
      StAddToCartAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StAddToCartAction model) async {
    final controller = Get.find<CartController>();
    
    controller.addToCart(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      basePrice: model.basePrice,
      size: model.size,
      addons: model.addons,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${model.name} added to cart!'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFFF6B35),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
