import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

import '../../layout/animation_config/st_animation_config.dart';

part 'st_cart_badge.g.dart';

@JsonSerializable(explicitToJson: true)
class StCartBadge extends StacWidget {
  final String? iconColor;
  final String? badgeColor;
  final double? iconSize;
  final StacAction? onTap;
  final StacAnimationConfig? badgeAnimation;

  const StCartBadge({
    this.iconColor,
    this.badgeColor,
    this.iconSize,
    this.onTap,
    this.badgeAnimation,
  });

  @override
  String get type => 'cart_badge';

  factory StCartBadge.fromJson(Map<String, dynamic> json) =>
      _$StCartBadgeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartBadgeToJson(this);
}
