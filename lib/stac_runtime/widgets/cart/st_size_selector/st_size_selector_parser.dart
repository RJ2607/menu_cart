import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/item_selection_controller.dart';
import 'st_size_selector.dart';

class StSizeSelectorParser extends StacParser<StSizeSelector> {
  const StSizeSelectorParser();

  @override
  String get type => 'size_selector';

  @override
  StSizeSelector getModel(Map<String, dynamic> json) =>
      StSizeSelector.fromJson(json);

  @override
  Widget parse(BuildContext context, StSizeSelector model) {
    return _SizeSelectorWidget(model: model);
  }
}

class _SizeSelectorWidget extends StatelessWidget {
  const _SizeSelectorWidget({required this.model});

  final StSizeSelector model;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ItemSelectionController(
        stateKey: model.stateKey,
        initialSize: model.initialValue ?? 'Regular',
      ),
      tag: model.stateKey,
    );

    return Obx(() {
      return Row(
        children: model.options.map((option) {
          final label = option['label'] as String;
          final price = (option['price'] as num).toDouble();
          final isSelected = controller.selectedSize.value == label;

          return GestureDetector(
            onTap: () => controller.selectSize(label),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF6B35)
                    : const Color(0xFFFFF8F3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF6B35)
                      : const Color(0xFF636E72).withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF2D3436),
                    ),
                  ),
                  if (price > 0)
                    Text(
                      '+\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.white.withOpacity(0.9)
                            : const Color(0xFF636E72),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
