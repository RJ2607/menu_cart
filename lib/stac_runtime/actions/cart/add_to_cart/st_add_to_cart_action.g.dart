// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_add_to_cart_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StAddToCartAction _$StAddToCartActionFromJson(Map<String, dynamic> json) =>
    StAddToCartAction(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      size: json['size'] as String? ?? 'Regular',
      addons: (json['addons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StAddToCartActionToJson(StAddToCartAction instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'basePrice': instance.basePrice,
      'size': instance.size,
      'addons': instance.addons,
    };
