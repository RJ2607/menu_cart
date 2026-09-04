import 'package:get/get.dart';

/// Controller for managing item selection state (size and addons)
/// Used by size selector, addon selector, and price display widgets
class ItemSelectionController extends GetxController {
  ItemSelectionController({
    required this.stateKey,
    String? initialSize,
    List<String>? initialAddons,
  })  : selectedSize = (initialSize ?? 'Regular').obs,
        selectedAddons = RxList<String>(initialAddons ?? []);

  final String stateKey;
  final RxString selectedSize;
  final RxList<String> selectedAddons;

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void toggleAddon(String addon) {
    if (selectedAddons.contains(addon)) {
      selectedAddons.remove(addon);
    } else {
      selectedAddons.add(addon);
    }
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
