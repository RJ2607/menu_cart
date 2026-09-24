import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../enums/st_enums/st_curves.dart';
import '../../layout/animation_config/st_animation.dart';
import '../../layout/animation_config/st_animation_config.dart';
import 'st_cart_badge.dart';

class StCartBadgeParser extends StacParser<StCartBadge> {
  const StCartBadgeParser();

  @override
  String get type => 'cart_badge';

  @override
  StCartBadge getModel(Map<String, dynamic> json) => StCartBadge.fromJson(json);

  @override
  Widget parse(BuildContext context, StCartBadge model) {
    return _CartBadgeWidget(model: model);
  }
}

class _CartBadgeWidget extends StatelessWidget {
  const _CartBadgeWidget({required this.model});

  final StCartBadge model;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    final iconColor =
        model.iconColor?.toColor(context) ?? const Color(0xFF2D3436);
    final badgeColor =
        model.badgeColor?.toColor(context) ?? const Color(0xFFFF6B35);

    return GestureDetector(
      onTap: model.onTap == null
          ? null
          : () => Stac.onCallFromJson(model.onTap?.jsonData, context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.shopping_cart,
              color: iconColor,
              size: model.iconSize ?? 28,
            ),
            Obx(() {
              final count = cartController.cartCount;
              final animation =
                  model.badgeAnimation ??
                  const StacAnimationConfig(
                    durationMs: 200,
                    curve: StCurves.easeOutBack,
                    outCurve: StCurves.easeIn,
                    opacityBegin: 0,
                    scaleBegin: 0.7,
                  );

              return Positioned(
                right: -4,
                top: -4,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: animation.durationMs),
                  switchInCurve: stAnimationCurve(animation.curve),
                  switchOutCurve: stAnimationCurve(animation.outCurve),
                  transitionBuilder: (child, value) =>
                      stSwitchTransition(child, value, animation),
                  child: count == 0
                      ? const SizedBox.shrink(key: ValueKey('empty-cart-badge'))
                      : Container(
                          key: ValueKey('cart-badge-$count'),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Center(
                            child: Text(
                              count > 99 ? '99+' : '$count',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
