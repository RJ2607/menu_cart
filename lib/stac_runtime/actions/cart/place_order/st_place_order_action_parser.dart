import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../core/controllers/festive_controller.dart';
import '../../../../utils/money.dart';
import 'st_place_order_action.dart';

/// Parses and dispatches [StPlaceOrderAction].
/// Shows a festive-aware order success dialog (subtotal, discount, delivery,
/// total + savings banner) and clears the cart.
class StPlaceOrderActionParser extends StacActionParser<StPlaceOrderAction> {
  const StPlaceOrderActionParser();

  @override
  String get actionType => 'place_order';

  @override
  StPlaceOrderAction getModel(Map<String, dynamic> json) => StPlaceOrderAction.fromJson(json);

  FestiveController _festive() {
    try {
      return FestiveController.to;
    } catch (_) {
      return Get.put(FestiveController(), permanent: true);
    }
  }

  @override
  Future<void> onCall(BuildContext context, StPlaceOrderAction model) async {
    final cartController = Get.find<CartController>();
    final festive = _festive();
    final offer = festive.activeOffer;
    final subtotal = cartController.subtotal;
    final discount = festive.discountAmount;
    final delivery = cartController.deliveryFee;
    final orderTotal = festive.total;
    final symbol = offer?.currencySymbol ?? '₹';
    final theme = _hex(offer?.themeColor, const Color(0xFFFF6B35));
    final accent = _hex(offer?.accentColor, const Color(0xFFFFFFFF));

    // Show success dialog
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success icon — themed by the active festive offer so the
              // checkout moment feels like the festival the user came from.
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: theme,
                  size: 64,
                ),
              ),
              const SizedBox(height: 16),
              if (offer != null) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '${offer.badgeLabel} • ${offer.code}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: accent,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 24),
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D3436),
                ),
              ),
              const SizedBox(height: 12),
              // Festive-aware bill breakdown — driven by FestiveController so
              // any future festival added to the registry renders here.
              _billRow('Subtotal', money(symbol, subtotal)),
              if (offer != null && discount > 0) ...[
                const SizedBox(height: 6),
                _billRow('${offer.name} Discount (${offer.code})',
                    '-${money(symbol, discount)}',
                    valueColor: const Color(0xFF1E8E3E)),
              ],
              const SizedBox(height: 6),
              _billRow('Delivery', money(symbol, delivery)),
              const Divider(height: 24),
              _billRow('Total', money(symbol, orderTotal), isTotal: true),
              if (offer != null && discount > 0) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4EA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'You saved ${money(symbol, discount)} with ${offer.code} 🎉',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E8E3E),
                    ),
                  ),
                ),
              ] else if (offer != null && discount <= 0) ...[
                // Applied but below the min-order: same logic for percent AND
                // flat festivals (flat ₹500 also needs ₹2000 first).
                const SizedBox(height: 12),
                Text(
                  '${offer.unlockHint(subtotal)} to use ${offer.code}.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF636E72)),
                ),
              ] else ...[
                const SizedBox(height: 12),
                const Text(
                  'Tip: apply a festive offer from the home screen to save on your next order.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xFF636E72)),
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    cartController.clearCart();
                    Navigator.of(context).pushNamedAndRemoveUntil('menu', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back to Menu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _billRow(String label, String value, {bool isTotal = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: isTotal ? 18 : 14,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
                color: const Color(0xFF636E72))),
        Text(value,
            style: TextStyle(
                fontSize: isTotal ? 20 : 14,
                fontWeight: FontWeight.w700,
                color: valueColor ?? const Color(0xFF2D3436))),
      ],
    );
  }

  Color _hex(String? hex, Color fallback) {
    if (hex == null || hex.isEmpty) return fallback;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return fallback;
    }
  }
}
