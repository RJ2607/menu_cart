// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_quantity_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityControl _$QuantityControlFromJson(Map<String, dynamic> json) =>
    QuantityControl(
      cartItemIndex: (json['cartItemIndex'] as num).toInt(),
      currentQuantity: (json['currentQuantity'] as num).toInt(),
    );

Map<String, dynamic> _$QuantityControlToJson(QuantityControl instance) =>
    <String, dynamic>{
      'cartItemIndex': instance.cartItemIndex,
      'currentQuantity': instance.currentQuantity,
      'type': instance.type,
    };
