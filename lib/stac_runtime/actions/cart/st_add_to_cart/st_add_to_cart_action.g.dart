// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_add_to_cart_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StAddToCartAction _$StAddToCartActionFromJson(Map<String, dynamic> json) =>
    StAddToCartAction(
      stateKey: json['stateKey'] as String,
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      itemImageUrl: json['itemImageUrl'] as String,
      itemBasePrice: json['itemBasePrice'],
    );

Map<String, dynamic> _$StAddToCartActionToJson(StAddToCartAction instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemImageUrl': instance.itemImageUrl,
      'itemBasePrice': instance.itemBasePrice,
      'actionType': instance.actionType,
    };
