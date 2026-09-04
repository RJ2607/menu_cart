import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/cart_controller.dart';
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
      final isSelected = cartController.selectedCategory.value == model.category;

      return GestureDetector(
        onTap: () => cartController.setCategory(model.category),
        child: Container(
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
                  : const Color(0xFF636E72).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Text(
            model.category,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? Colors.white
                  : const Color(0xFF636E72),
            ),
          ),
        ),
      );
    });
  }
}
