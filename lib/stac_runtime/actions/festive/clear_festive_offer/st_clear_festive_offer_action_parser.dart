import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/festive_controller.dart';
import 'st_clear_festive_offer_action.dart';

/// Clears the applied festive offer (if any), toasts, then optionally
/// navigates — dispatched through the standard Stac pipeline.
class StClearFestiveOfferActionParser extends StacActionParser<StClearFestiveOfferAction> {
  const StClearFestiveOfferActionParser();

  @override
  String get actionType => 'clear_festive_offer';

  @override
  StClearFestiveOfferAction getModel(Map<String, dynamic> json) =>
      StClearFestiveOfferAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StClearFestiveOfferAction action) async {
    FestiveController controller;
    try {
      controller = FestiveController.to;
    } catch (_) {
      controller = Get.put(FestiveController(), permanent: true);
    }
    final hadOffer = controller.hasOffer;
    final removedName = controller.activeOffer?.name;
    controller.clear();

    if (action.showToast && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hadOffer
              ? '${removedName ?? 'Festive'} offer removed'
              : 'No festive offer applied'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    if (action.navigateTo == 'menu') {
      await Stac.onCallFromJson(StacNavigator.pushStac('menu').toJson(), context);
    } else if (action.navigateTo == 'cart') {
      await Stac.onCallFromJson(StacNavigator.pushStac('cart').toJson(), context);
    }
  }
}
