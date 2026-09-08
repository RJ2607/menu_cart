import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import 'st_cart_summary_builder.dart';

/// Parser for StCartSummaryBuilder that renders cart charges and action button.
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
            ...model.chargeItems.asMap().entries.map((entry) {
              final index = entry.key;
              final chargeItem = entry.value;
              final isLast = index == model.chargeItems.length - 1;

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
          ],
        ),
      );
    });
  }

  Widget _buildChargeRow(CartController controller, ChargeItem chargeItem) {
    // Get value from controller based on valueKey
    double value;
    switch (chargeItem.valueKey) {
      case 'subtotal':
        value = controller.subtotal;
        break;
      case 'deliveryFee':
        value = controller.deliveryFee;
        break;
      case 'total':
        value = controller.total;
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

    final valueColor = chargeItem.isTotal
        ? const Color(0xFFFF6B35)
        : const Color(0xFF2D3436);

    final valueFontSize = chargeItem.isTotal ? 24.0 : 16.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          chargeItem.label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
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
