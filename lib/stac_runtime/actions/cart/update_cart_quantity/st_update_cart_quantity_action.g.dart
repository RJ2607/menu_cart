// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_update_cart_quantity_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StUpdateCartQuantityAction _$StUpdateCartQuantityActionFromJson(
        Map<String, dynamic> json) =>
    StUpdateCartQuantityAction(
      index: (json['index'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$StUpdateCartQuantityActionToJson(
        StUpdateCartQuantityAction instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'index': instance.index,
      'quantity': instance.quantity,
    };
