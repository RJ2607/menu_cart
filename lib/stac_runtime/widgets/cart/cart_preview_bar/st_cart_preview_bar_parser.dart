import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_cart_preview_bar.dart';

/// Parses [StCartPreviewBar]: last-added item thumbnail + ellipsized name +
/// "View in cart" label; tap pushes the cart. Hidden when cart is empty.
class StCartPreviewBarParser extends StacParser<StCartPreviewBar> {
  const StCartPreviewBarParser();

  static Color? _parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return null;
    }
  }

  @override
  String get type => 'st_cart_preview_bar';

  @override
  StCartPreviewBar getModel(Map<String, dynamic> json) =>
      StCartPreviewBar.fromJson(json);

  @override
  Widget parse(BuildContext context, StCartPreviewBar model) {
    CartController controller;
    try {
      controller = CartController.to;
    } catch (_) {
      controller = Get.put(CartController(), permanent: true);
    }

    final viewLabel = model.viewLabel ?? 'View in cart';
    final imageSize = model.imageSize ?? 44.0;
    final bg = model.backgroundColor != null
        ? _parseColor(model.backgroundColor!) ?? Colors.white
        : Colors.white;
    final textColor = model.textColor != null
        ? _parseColor(model.textColor!) ?? const Color(0xFF2D3436)
        : const Color(0xFF2D3436);
    final accent = model.accentColor != null
        ? _parseColor(model.accentColor!) ?? const Color(0xFFFF6B35)
        : const Color(0xFFFF6B35);
    final radius = model.borderRadius ?? 16.0;

    return Obx(() {
      final items = controller.cartItems;
      if (items.isEmpty) return const SizedBox.shrink();
      final last = items.last;

      return GestureDetector(
        onTap: () => Stac.onCallFromJson(
          StacNavigator.pushStac('cart').toJson(),
          context,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.network(
                    last.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => ColoredBox(
                      color: const Color(0xFFFFF8F3),
                      child: Icon(Icons.fastfood, size: 24, color: accent),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  last.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                viewLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accent,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 16, color: accent),
            ],
          ),
        ),
      );
    });
  }
}
