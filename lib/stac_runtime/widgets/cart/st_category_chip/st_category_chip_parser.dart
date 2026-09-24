import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/cart_controller.dart';
import '../../../../shared/widgets/animated_pressable.dart';
import '../../layout/animation_config/st_animation.dart';
import 'st_category_chip.dart';

class StCategoryChipParser extends StacParser<StCategoryChip> {
  const StCategoryChipParser();

  @override
  String get type => 'category_chip';

  @override
  StCategoryChip getModel(Map<String, dynamic> json) =>
      StCategoryChip.fromJson(json);

  @override
  Widget parse(BuildContext context, StCategoryChip model) {
    return _CategoryChipWidget(model: model);
  }
}

class _CategoryChipWidget extends StatelessWidget {
  const _CategoryChipWidget({required this.model});

  final StCategoryChip model;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Obx(() {
      final isSelected =
          cartController.selectedCategory.value == model.category;

      final selectionAnimation = model.selectionAnimation;
      final pressAnimation = model.pressAnimation;
      return AnimatedPressable(
        onTap: () => cartController.setCategory(model.category),
        scaleMin: pressAnimation?.scaleEnd ?? 0.96,
        duration: Duration(milliseconds: pressAnimation?.durationMs ?? 150),
        curve: stAnimationCurve(pressAnimation?.curve),
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: selectionAnimation?.durationMs ?? 220,
          ),
          curve: stAnimationCurve(selectionAnimation?.curve),
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFF6B35)
                : const Color(0xFFFFF8F3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFF6B35)
                  : const Color(0xFF636E72).withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color(0x33FF6B35),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]
                : const [],
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(
              milliseconds: selectionAnimation?.durationMs ?? 220,
            ),
            curve: stAnimationCurve(selectionAnimation?.curve),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF636E72),
            ),
            child: Text(model.category),
          ),
        ),
      );
    });
  }
}
