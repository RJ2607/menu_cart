import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';
import '../../../../features/cart/cart_controller.dart';
import 'st_toggle_favorite_action.dart';

class StToggleFavoriteActionParser extends StacActionParser<StToggleFavoriteAction> {
  @override
  String get actionType => 'toggle_favorite';

  @override
  StToggleFavoriteAction getModel(Map<String, dynamic> json) =>
      StToggleFavoriteAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StToggleFavoriteAction model) async {
    final controller = Get.find<CartController>();
    controller.toggleFavorite(model.itemId);
  }
}
