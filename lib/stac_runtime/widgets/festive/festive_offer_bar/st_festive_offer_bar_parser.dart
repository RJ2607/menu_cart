import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../../../../core/controllers/festive_controller.dart';
import '../../../../core/festive/festive_offer.dart';
import '../../../../core/festive/festive_offers.dart';
import '../../../actions/festive/clear_festive_offer/st_clear_festive_offer_action.dart';
import '../../layout/animation_config/st_animation.dart';
import 'st_festive_offer_bar.dart';

class FestiveOfferBarParser extends StacParser<FestiveOfferBar> {
  const FestiveOfferBarParser();

  static Color _color(String hex, [Color fallback = const Color(0xFF2D3436)]) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return fallback;
    }
  }

  @override
  String get type => 'st_festive_offer_bar';

  @override
  FestiveOfferBar getModel(Map<String, dynamic> json) =>
      FestiveOfferBar.fromJson(json);

  @override
  Widget parse(BuildContext context, FestiveOfferBar model) {
    FestiveController controller;
    try {
      controller = FestiveController.to;
    } catch (_) {
      controller = Get.put(FestiveController(), permanent: true);
    }

    return Obx(() {
      final progressAnimation = model.progressAnimation;
      final FestiveOffer? pinned = model.festiveKey == null
          ? null
          : festiveOffers[model.festiveKey];
      final FestiveOffer? offer = pinned ?? controller.activeOffer;

      if (offer == null) {
        if (!model.showWhenNone) return const SizedBox.shrink();
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F1EA),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE0D6C2)),
          ),
          child: const Row(
            children: [
              Text('🎉', style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Tap a festival card to unlock its offer',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF636E72),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      final bool isActive = controller.activeKey.value == offer.key;
      final double subtotal = controller.subtotal;
      final bool eligible = offer.isEligible(subtotal);
      final String status = !isActive && pinned != null
          ? 'Tap to apply ${offer.code}'
          : eligible
          ? 'Applied • ${offer.code} unlocked'
          : 'Add ${offer.formatAmount(offer.minOrderSubtotal - subtotal)} more to unlock';
      final double progress = subtotal <= 0
          ? 0
          : (subtotal / offer.minOrderSubtotal).clamp(0, 1).toDouble();
      final String savingsLine = eligible
          ? '${offer.savingsPreview(subtotal)} on this cart'
          : offer.unlockHint(subtotal);

      final Color bg = model.backgroundColor != null
          ? _color(model.backgroundColor!)
          : _color(offer.themeColor);
      final Color accent = model.accentColor != null
          ? _color(model.accentColor!)
          : _color(offer.accentColor);

      if (model.compact) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(model.borderRadius ?? 100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '🏷️ ${offer.badgeLabel} • ${offer.code}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: accent,
                ),
              ),
              if (model.showRemoveButton && isActive) ...[
                const SizedBox(width: 8),
                _removeButton(context, bg, accent),
              ],
            ],
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bg, bg.withOpacity(0.75)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(model.borderRadius ?? 18),
          border: Border.all(color: accent.withOpacity(0.8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    offer.badgeLabel,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: bg,
                    ),
                  ),
                ),
                Text(
                  offer.code,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: accent,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${offer.name} festive offer • ${offer.amountOffLabel()} ${offer.minOrderLabel}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 8,
                color: Colors.white.withOpacity(0.25),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: progress),
                  duration: Duration(
                    milliseconds: progressAnimation?.durationMs ?? 350,
                  ),
                  curve: stAnimationCurve(progressAnimation?.curve),
                  builder: (context, value, _) => FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: value,
                    child: Container(color: accent),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              savingsLine,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: eligible ? accent : Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 12, color: accent),
                  ),
                ),
                if (model.showRemoveButton && isActive)
                  _removeButton(context, bg, accent),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _removeButton(BuildContext context, Color bg, Color accent) {
    return GestureDetector(
      onTap: () => Stac.onCallFromJson(
        const StClearFestiveOfferAction().toJson(),
        context,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: accent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: accent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Remove',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '✕',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
