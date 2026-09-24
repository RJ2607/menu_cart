import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

import '../../layout/animation_config/st_animation_config.dart';

part 'st_festive_offer_bar.g.dart';

/// Reactive festive offer banner driven by [FestiveController].
///
/// If [festiveKey] is set, that offer is shown; otherwise the currently
/// applied offer is shown. When nothing is applied:
/// - [showWhenNone] == true -> compact "tap a festival to unlock" hint.
/// - [showWhenNone] == false -> renders nothing (useful in cart/item detail).
/// [compact] renders a single-line chip instead of the full banner.
/// [showRemoveButton] adds a tappable remove affordance that dispatches
/// `clear_festive_offer` — rendered only while an offer is actively applied.
///
/// Purely JSON-stylable: [backgroundColor]/[accentColor] override the
/// registry theme, [borderRadius] overrides the card radius. Absent values
/// fall back to the active offer's theme, so new festivals look right with
/// zero JSON changes.
@JsonSerializable(explicitToJson: true)
class FestiveOfferBar extends StacWidget {
  const FestiveOfferBar({
    this.festiveKey,
    this.showWhenNone = true,
    this.compact = false,
    this.showRemoveButton = false,
    this.backgroundColor,
    this.accentColor,
    this.borderRadius,
    this.progressAnimation,
  });

  final String? festiveKey;
  final bool showWhenNone;
  final bool compact;
  final bool showRemoveButton;
  final String? backgroundColor;
  final String? accentColor;
  final double? borderRadius;
  final StacAnimationConfig? progressAnimation;

  @override
  String get type => 'st_festive_offer_bar';

  factory FestiveOfferBar.fromJson(Map<String, dynamic> json) =>
      _$FestiveOfferBarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FestiveOfferBarToJson(this);
}
