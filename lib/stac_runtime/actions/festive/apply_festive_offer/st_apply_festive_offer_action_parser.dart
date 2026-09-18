import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/festive_controller.dart';
import '../../wildcard_page_nav/st_wildcard_page_nav.dart';
import 'st_apply_festive_offer_action.dart';

/// Applies the festive offer, toasts, then optionally navigates — all through
/// the standard Stac dispatch pipeline so JSON and Dart behave identically.
class StApplyFestiveOfferActionParser extends StacActionParser<StApplyFestiveOfferAction> {
  const StApplyFestiveOfferActionParser();

  @override
  String get actionType => 'apply_festive_offer';

  @override
  StApplyFestiveOfferAction getModel(Map<String, dynamic> json) =>
      StApplyFestiveOfferAction.fromJson(json);

  @override
  Future<void> onCall(BuildContext context, StApplyFestiveOfferAction action) async {
    FestiveController controller;
    try {
      controller = FestiveController.to;
    } catch (_) {
      controller = Get.put(FestiveController(), permanent: true);
    }
    controller.apply(action.festiveKey);
    final offer = controller.activeOffer;

    if (action.showToast && offer != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${offer.name} offer applied: ${offer.code} (${offer.badgeLabel})'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    if (action.openWildcardPage != null) {
      await Stac.onCallFromJson(
        StWildcardPageNavAction(
          wildcardPage: action.openWildcardPage!,
        ).toJson(),
        context,
      );
    } else if (action.navigateTo == 'menu') {
      await Stac.onCallFromJson(StacNavigator.pushStac('menu').toJson(), context);
    } else if (action.navigateTo == 'cart') {
      await Stac.onCallFromJson(StacNavigator.pushStac('cart').toJson(), context);
    }
  }
}
