import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/item_selection_controller.dart';
import 'st_addon_selector.dart';

class StAddonSelectorParser extends StacParser<StAddonSelector> {
  const StAddonSelectorParser();

  @override
  String get type => 'addon_selector';

  @override
  StAddonSelector getModel(Map<String, dynamic> json) =>
      StAddonSelector.fromJson(json);

  @override
  Widget parse(BuildContext context, StAddonSelector model) {
    return _AddonSelectorWidget(model: model);
  }
}

class _AddonSelectorWidget extends StatelessWidget {
  const _AddonSelectorWidget({required this.model});

  final StAddonSelector model;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemSelectionController>(tag: model.stateKey);

    return Obx(() {
      return Column(
        children: model.options.map((option) {
          final label = option['label'] as String;
          final price = (option['price'] as num).toDouble();
          final isSelected = controller.selectedAddons.contains(label);

          return GestureDetector(
            onTap: () => controller.toggleAddon(label),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF6B35).withOpacity(0.1)
                    : const Color(0xFFFFF8F3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF6B35)
                      : const Color(0xFF636E72).withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: const Color(0xFF2D3436),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '+\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? const Color(0xFFFF6B35)
                            : const Color(0xFF636E72).withOpacity(0.2),
                        size: 22,
                      ),
                    ],
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
