// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_cart_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StCartBadge _$StCartBadgeFromJson(Map<String, dynamic> json) => StCartBadge(
      iconColor: json['iconColor'] as String?,
      badgeColor: json['badgeColor'] as String?,
      iconSize: (json['iconSize'] as num?)?.toDouble(),
      onTap: json['onTap'] == null
          ? null
          : StacAction.fromJson(json['onTap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StCartBadgeToJson(StCartBadge instance) =>
    <String, dynamic>{
      'iconColor': instance.iconColor,
      'badgeColor': instance.badgeColor,
      'iconSize': instance.iconSize,
      'onTap': instance.onTap,
      'type': instance.type,
    };
