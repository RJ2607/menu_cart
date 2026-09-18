import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/cart_controller.dart';
import 'package:menu_cart/core/festive/festive_offer.dart';
import 'package:menu_cart/core/festive/festive_offers.dart';

/// Holds the currently applied festive campaign.
///
/// Driven from SDUI via `apply_festive_offer` (tapping a festival card or a
/// "Check festive menu" CTA). All totals below are reactive: cart rows,
/// the festive offer bar and the checkout dialog update automatically.
class FestiveController extends GetxController {
  static FestiveController get to => Get.find();

  /// Wildcard child key, e.g. 'diwali_discount'. Empty = no offer applied.
  final RxString activeKey = ''.obs;

  FestiveOffer? get activeOffer => festiveOffers[activeKey.value];
  bool get hasOffer => activeOffer != null;

  double get subtotal {
    try {
      return CartController.to.subtotal;
    } catch (_) {
      return 0;
    }
  }

  double get discountAmount {
    final offer = activeOffer;
    if (offer == null) return 0;
    return offer.discountFor(subtotal);
  }

  bool get isEligible {
    final offer = activeOffer;
    if (offer == null) return false;
    return offer.isEligible(subtotal);
  }

  /// Amount still needed to unlock the offer (0 when eligible / no offer).
  double get amountToUnlock {
    final offer = activeOffer;
    if (offer == null) return 0;
    final diff = offer.minOrderSubtotal - subtotal;
    return diff <= 0 ? 0 : diff;
  }

  double get deliveryFee {
    try {
      return CartController.to.deliveryFee;
    } catch (_) {
      return 49;
    }
  }

  double get total => subtotal - discountAmount + deliveryFee;

  String get discountLabel {
    final offer = activeOffer;
    if (offer == null) return 'Discount';
    return '${offer.name} Discount (${offer.code})';
  }

  void apply(String key) {
    if (festiveOffers.containsKey(key)) {
      activeKey.value = key;
    }
  }

  void clear() => activeKey.value = '';
}
