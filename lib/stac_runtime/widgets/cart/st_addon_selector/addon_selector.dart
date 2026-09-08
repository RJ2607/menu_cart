import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/item_selection_controller.dart';

class AddonSelector extends StatefulWidget {
  const AddonSelector({
    super.key,
    required this.stateKey,
    required this.options,
    this.initialSelected,
  });

  final String stateKey;
  final List<Map<String, dynamic>> options;
  final List<String>? initialSelected;

  @override
  State<AddonSelector> createState() => _AddonSelectorState();
}

class _AddonSelectorState extends State<AddonSelector> {
  late final ItemSelectionController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<ItemSelectionController>(tag: widget.stateKey);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.generate(widget.options.length, (i) {
          var data = widget.options[i];
          var label = data['label'] as String;
          var price = (data['price'] as num).toDouble();
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
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
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
        }),
      ),
    );
  }
}
