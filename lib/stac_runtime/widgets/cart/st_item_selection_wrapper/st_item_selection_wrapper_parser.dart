import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/item_selection_controller.dart';
import 'package:menu_cart/core/menu_data.dart';
import 'package:stac/stac.dart';

import '../../../utils/inject_data.dart';
import 'st_item_selection_wrapper.dart';

class StItemSelectionWrapperParser extends StacParser<StItemSelectionWrapper> {
  @override
  String get type => 'item_selection_wrapper';

  @override
  StItemSelectionWrapper getModel(Map<String, dynamic> json) =>
      StItemSelectionWrapper.fromJson(json);

  @override
  Widget parse(BuildContext context, StItemSelectionWrapper model) {
    return _ItemSelectionWrapperWidget(model: model);
  }
}

class _ItemSelectionWrapperWidget extends StatefulWidget {
  const _ItemSelectionWrapperWidget({required this.model});

  final StItemSelectionWrapper model;

  @override
  State<_ItemSelectionWrapperWidget> createState() =>
      _ItemSelectionWrapperWidgetState();
}

class _ItemSelectionWrapperWidgetState
    extends State<_ItemSelectionWrapperWidget> {
  MenuItem? _item;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_item != null) return;

    final arg = ModalRoute.of(context)?.settings.arguments;
    final itemId = arg is Map ? arg['itemId']?.toString() : null;
    for (final candidate in menuItems) {
      if (candidate.id == itemId) {
        _item = candidate;
        break;
      }
    }

    final existing = Get.isRegistered<ItemSelectionController>(
      tag: widget.model.stateKey,
    );
    if (existing) {
      Get.delete<ItemSelectionController>(
        tag: widget.model.stateKey,
        force: true,
      );
    }
    Get.put(
      ItemSelectionController(
        stateKey: widget.model.stateKey,
        initialSize: widget.model.initialSize,
        initialAddons: widget.model.initialAddons,
        initialItem: _item,
      ),
      tag: widget.model.stateKey,
    );
  }

  @override
  void dispose() {
    // Clean up when navigating away from this screen.
    if (Get.isRegistered<ItemSelectionController>(tag: widget.model.stateKey)) {
      Get.delete<ItemSelectionController>(
        tag: widget.model.stateKey,
        force: true,
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = _item;
    if (item == null) {
      return const Center(child: Text('Item not found'));
    }

    final itemData = <String, dynamic>{
      'id': item.id,
      'name': item.name,
      'description': item.description,
      'category': item.category,
      'price': item.price,
      'imageUrl': item.imageUrl,
      'isVegetarian': item.isVegetarian,
      'isAvailable': item.isAvailable,
      'isFeatured': item.isFeatured,
    };

    final controller = Get.find<ItemSelectionController>(
      tag: widget.model.stateKey,
    );
    return Obx(() {
      final selectedSize = controller.selectedSize.value;
      final selectedAddons = List<String>.from(controller.selectedAddons);
      final total = controller.calculateTotalPrice(
        basePrice: item.price,
        sizePrices: const {'Regular': 0.0, 'Large': 2.5},
        addonPrices: const {'Extra Cheese': 1.5, 'Bacon': 2.0, 'Avocado': 2.5},
      );
      final resolvedData = <String, dynamic>{
        ...itemData,
        'selectedSize': selectedSize,
        'totalPrice': total,
        'totalPriceLabel': '\$${total.toStringAsFixed(2)}',
        'regularSelected': selectedSize == 'Regular',
        'largeSelected': selectedSize == 'Large',
        'extraCheeseSelected': selectedAddons.contains('Extra Cheese'),
        'baconSelected': selectedAddons.contains('Bacon'),
        'avocadoSelected': selectedAddons.contains('Avocado'),
      };
      return Stac.fromJson(
            injectData(widget.model.child.toJson(), resolvedData),
            context,
          ) ??
          const SizedBox.shrink();
    });
  }
}
