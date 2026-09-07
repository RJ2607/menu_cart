import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/stac_runtime/actions/cart/place_order/st_place_order_action.dart';
import 'package:menu_cart/stac_runtime/actions/cart/place_order/st_place_order_action_parser.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_dynamic_cart_summary.dart';

/// Parses the "st_dynamic_cart_summary" Stac widget type.
/// Displays order summary with subtotal, delivery fee, total and place order button.
class DynamicCartSummaryParser extends StacParser<DynamicCartSummary> {
  @override
  String get type => 'st_dynamic_cart_summary';

  @override
  DynamicCartSummary getModel(Map<String, dynamic> json) =>
      DynamicCartSummary.fromJson(json);

  @override
  Widget parse(BuildContext context, DynamicCartSummary model) {
    final controller = Get.find<CartController>();

    return Obx(() {
      final cartItems = controller.cartItems;

      if (cartItems.isEmpty) {
        return const SizedBox.shrink();
      }

      final subtotal = controller.subtotal;
      final deliveryFee = controller.deliveryFee;
      final total = controller.total;

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 16, color: Color(0xFF636E72)),
                ),
                Text(
                  '\$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Delivery fee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Fee',
                  style: TextStyle(fontSize: 16, color: Color(0xFF636E72)),
                ),
                Text(
                  '\$${deliveryFee.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: const Color(0xFF636E72).withOpacity(0.2),
              thickness: 1,
            ),
            const SizedBox(height: 12),
            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D3436),
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF6B35),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Place order button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  const StPlaceOrderActionParser().onCall(
                    context,
                    const StPlaceOrderAction(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B35),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
