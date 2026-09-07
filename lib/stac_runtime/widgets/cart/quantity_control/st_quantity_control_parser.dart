import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_quantity_control.dart';

/// Parses the "st_quantity_control" Stac widget type.
/// Provides increment/decrement buttons for cart item quantity.
class QuantityControlParser extends StacParser<QuantityControl> {
  @override
  String get type => 'st_quantity_control';

  @override
  QuantityControl getModel(Map<String, dynamic> json) => QuantityControl.fromJson(json);

  @override
  Widget parse(BuildContext context, QuantityControl model) {
    final controller = Get.find<CartController>();
    
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement button
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            onPressed: () {
              final newQuantity = model.currentQuantity - 1;
              controller.updateQuantity(model.cartItemIndex, newQuantity);
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: const Color(0xFF2D3436),
          ),
          // Quantity display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${model.currentQuantity}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3436),
              ),
            ),
          ),
          // Increment button
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            onPressed: () {
              final newQuantity = model.currentQuantity + 1;
              controller.updateQuantity(model.cartItemIndex, newQuantity);
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: const Color(0xFF2D3436),
          ),
        ],
      ),
    );
  }
}
