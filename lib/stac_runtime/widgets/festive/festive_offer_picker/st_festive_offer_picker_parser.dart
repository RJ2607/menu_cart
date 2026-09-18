import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/festive_controller.dart';
import '../../../../core/festive/festive_offer.dart';
import '../../../../core/festive/festive_offers.dart';
import '../../../actions/festive/apply_festive_offer/st_apply_festive_offer_action.dart';
import 'st_festive_offer_picker.dart';

/// Renders one chip per registry offer; tap applies it via the standard
/// Stac action pipeline. Theming comes from each [FestiveOffer], so new
/// festivals render correctly with zero changes here.
class FestiveOfferPickerParser extends StacParser<FestiveOfferPicker> {
  const FestiveOfferPickerParser();

  static Color _color(String hex, [Color fallback = const Color(0xFF2D3436)]) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return fallback;
    }
  }

  @override
  String get type => 'st_festive_offer_picker';

  @override
  FestiveOfferPicker getModel(Map<String, dynamic> json) =>
      FestiveOfferPicker.fromJson(json);

  @override
  Widget parse(BuildContext context, FestiveOfferPicker model) {
    FestiveController controller;
    try {
      controller = FestiveController.to;
    } catch (_) {
      controller = Get.put(FestiveController(), permanent: true);
    }

    return Obx(() {
      final activeKey = controller.activeKey.value;
      final offers = festiveOffers.values.toList();
      final spacing = model.spacing ?? 10.0;
      final radius = model.borderRadius ?? 100.0;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.title ?? 'Apply festive offer',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D3436),
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < offers.length; i++) ...[
                    if (i > 0) SizedBox(width: spacing),
                    _chip(context, offers[i], offers[i].key == activeKey, model.showCodes, radius),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _chip(BuildContext context, FestiveOffer offer, bool isActive, bool showCodes, double radius) {
    final bg = isActive ? _color(offer.themeColor) : Colors.white;
    final fg = isActive ? _color(offer.accentColor) : _color(offer.themeColor);
    return GestureDetector(
      onTap: () => Stac.onCallFromJson(
        StApplyFestiveOfferAction(festiveKey: offer.key).toJson(),
        context,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: _color(offer.themeColor), width: isActive ? 2 : 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) ...[
              Text('✓ ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: fg)),
            ],
            Text(offer.name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: fg)),
            const SizedBox(width: 6),
            Text(offer.badgeLabel,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg)),
            if (showCodes) ...[
              const SizedBox(width: 6),
              Text(offer.code,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg.withOpacity(0.8))),
            ],
          ],
        ),
      ),
    );
  }
}
