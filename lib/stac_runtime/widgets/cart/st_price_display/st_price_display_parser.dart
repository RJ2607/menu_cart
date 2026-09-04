import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/item_selection_controller.dart';
import 'st_price_display.dart';

class StPriceDisplayParser extends StacParser<StPriceDisplay> {
  const StPriceDisplayParser();

  @override
  String get type => 'price_display';

  @override
  StPriceDisplay getModel(Map<String, dynamic> json) =>
      StPriceDisplay.fromJson(json);

  @override
  Widget parse(BuildContext context, StPriceDisplay model) {
    return _PriceDisplayWidget(model: model);
  }
}

class _PriceDisplayWidget extends StatelessWidget {
  const _PriceDisplayWidget({required this.model});

  final StPriceDisplay model;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemSelectionController>(tag: model.stateKey);

    return Obx(() {
      double totalPrice = model.basePrice;

      // Add size price
      if (model.sizePrices != null && 
          model.sizePrices!.containsKey(controller.selectedSize.value)) {
        totalPrice += model.sizePrices![controller.selectedSize.value]!;
      }

      // Add addon prices
      if (model.addonPrices != null) {
        for (var addon in controller.selectedAddons) {
          if (model.addonPrices!.containsKey(addon)) {
            totalPrice += model.addonPrices![addon]!;
          }
        }
      }

      return Text(
        '\$${totalPrice.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6B35),
        ),
      );
    });
  }
}
