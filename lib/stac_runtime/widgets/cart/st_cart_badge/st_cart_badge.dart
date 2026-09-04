import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_cart_badge.g.dart';

@JsonSerializable()
class StCartBadge extends StacWidget {
  final String? iconColor;
  final String? badgeColor;
  final double? iconSize;
  final StacAction? onTap;

  const StCartBadge({
    this.iconColor,
    this.badgeColor,
    this.iconSize,
    this.onTap,
  });

  @override
  String get type => 'cart_badge';

  factory StCartBadge.fromJson(Map<String, dynamic> json) =>
      _$StCartBadgeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartBadgeToJson(this);
}
