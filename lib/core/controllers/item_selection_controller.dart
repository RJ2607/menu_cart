import 'package:get/get.dart';
import 'package:menu_cart/core/menu_data.dart';

/// Controller for managing item selection state (size and addons)
/// Used by size selector, addon selector, and price display widgets
class ItemSelectionController extends GetxController {
  ItemSelectionController({
    required this.stateKey,
    String? initialSize,
    List<String>? initialAddons,
    MenuItem? initialItem,
  }) : selectedSize = (initialSize ?? 'Regular').obs,
       selectedAddons = RxList<String>(initialAddons ?? []),
       selectedItem = initialItem.obs;

  final String stateKey;
  final RxString selectedSize;
  final RxList<String> selectedAddons;
  final Rx<MenuItem?> selectedItem;

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void toggleAddon(String addon) {
    if (selectedAddons.contains(addon)) {
      selectedAddons.remove(addon);
    } else {
      selectedAddons.add(addon);
    }
    selectedAddons.refresh(); // Notify listeners of the change
    update(); // Notify GetBuilder listeners
  }

  double calculateTotalPrice({
    required double basePrice,
    Map<String, double>? sizePrices,
    Map<String, double>? addonPrices,
  }) {
    double total = basePrice;

    // Add size price
    if (sizePrices != null && sizePrices.containsKey(selectedSize.value)) {
      total += sizePrices[selectedSize.value]!;
    }

    // Add addon prices
    if (addonPrices != null) {
      for (var addon in selectedAddons) {
        if (addonPrices.containsKey(addon)) {
          total += addonPrices[addon]!;
        }
      }
    }

    return total;
  }

  @override
  void onClose() {
    // Clean up when controller is disposed
    super.onClose();
  }
}
