import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../core/controllers/festive_controller.dart';
import '../../../../utils/money.dart';
import 'st_cart_summary_builder.dart';

class StCartSummaryBuilderParser extends StacParser<StCartSummaryBuilder> {
  const StCartSummaryBuilderParser();

  static Color? _parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }

  static FontWeight _parseFontWeight(String? weight) {
    switch (weight) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  @override
  String get type => 'cart_summary_builder';

  @override
  StCartSummaryBuilder getModel(Map<String, dynamic> json) =>
      StCartSummaryBuilder.fromJson(json);

  @override
  Widget parse(BuildContext context, StCartSummaryBuilder model) {
    final controller = CartController.to;

    return Obx(() {
      final cartItems = controller.cartItems;

      // Hide if cart is empty
      if (cartItems.isEmpty) {
        return const SizedBox.shrink();
      }

      final radius = model.borderTopRadius ?? 24;
      final padding = model.padding ?? 20;
      final rowSpacing = model.rowSpacing ?? 12;

      final festive = _festive();
      final hasCode = festive.activeOffer != null;
      final visibleCharges = model.chargeItems
          .where((c) => !c.visibleWhenCode || hasCode)
          .toList();

      return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: _parseColor(model.backgroundColor) ?? Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
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
            // Render charge items
            ...visibleCharges.asMap().entries.map((entry) {
              final index = entry.key;
              final chargeItem = entry.value;
              final isLast = index == visibleCharges.length - 1;

              return Column(
                children: [
                  _buildChargeRow(controller, chargeItem),
                  if (!isLast) SizedBox(height: rowSpacing),
                  // Show divider before total row if enabled
                  if (model.showDivider && chargeItem.isTotal && index > 0) ...[
                    SizedBox(height: rowSpacing),
                    Divider(
                      color:
                          _parseColor(model.dividerColor) ??
                          const Color(0xFF636E72).withOpacity(0.2),
                      thickness: 1,
                    ),
                    SizedBox(height: rowSpacing),
                  ],
                ],
              );
            }),

            // Render action button if provided
            if (model.actionButton != null) ...[
              SizedBox(height: rowSpacing + 8),
              Stac.fromJson(model.actionButton!.toJson(), context) ??
                  const SizedBox.shrink(),
            ],
            Builder(
              builder: (context) {
                final festive = _festive();
                final offer = festive.activeOffer;
                final saved = festive.discountAmount;
                if (offer == null || saved <= 0) return const SizedBox.shrink();
                final symbol = offer.currencySymbol;
                return Column(
                  children: [
                    SizedBox(height: rowSpacing + 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F4EA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '🎉 You save ${money(symbol, saved)} with ${offer.code} — pay ${money(symbol, festive.total)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E8E3E),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }

  FestiveController _festive() {
    try {
      return FestiveController.to;
    } catch (_) {
      return Get.put(FestiveController(), permanent: true);
    }
  }

  Widget _buildChargeRow(CartController controller, ChargeItem chargeItem) {
    final festive = _festive();
    // Labels may carry a {{code}} template so future festivals render their
    // own code with zero JSON/parser changes.
    var label = chargeItem.label;
    final code = festive.activeOffer?.code ?? '';
    label = label.replaceAll('{{code}}', code);

    // Get value from controllers based on valueKey.
    // New keys: "discount" (festive savings) and festive-aware "total".
    // "total" now = subtotal - discount + deliveryFee so old JSON keeps
    // working and new JSON can add an explicit discount row.
    double value;
    var isDiscount = false;
    switch (chargeItem.valueKey) {
      case 'subtotal':
        value = controller.subtotal;
        break;
      case 'deliveryFee':
        value = controller.deliveryFee;
        break;
      case 'discount':
        value = festive.discountAmount;
        isDiscount = true;
        break;
      case 'total':
        value = festive.total;
        break;
      default:
        value = 0.0;
    }

    final fontSize = chargeItem.fontSize ?? (chargeItem.isTotal ? 20 : 16);
    final fontWeight = chargeItem.isTotal
        ? _parseFontWeight(chargeItem.fontWeight ?? 'w700')
        : _parseFontWeight(chargeItem.fontWeight ?? 'w600');
    final color =
        _parseColor(chargeItem.color) ??
        (chargeItem.isTotal
            ? const Color(0xFF2D3436)
            : const Color(0xFF636E72));

    final valueColor = isDiscount
        ? const Color(0xFF1E8E3E)
        : chargeItem.isTotal
        ? const Color(0xFFFF6B35)
        : const Color(0xFF2D3436);

    final valueFontSize = chargeItem.isTotal ? 24.0 : 16.0;
    final symbol = festive.activeOffer?.currencySymbol ?? '₹';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
        Text(
          isDiscount ? '-${money(symbol, value)}' : money(symbol, value),
          style: TextStyle(
            fontSize: valueFontSize,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
