// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_add_to_cart_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartButton _$AddToCartButtonFromJson(Map<String, dynamic> json) =>
    AddToCartButton(
      stateKey: json['stateKey'] as String,
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      itemImageUrl: json['itemImageUrl'] as String,
      itemBasePrice: (json['itemBasePrice'] as num).toDouble(),
      buttonText: json['buttonText'] as String? ?? 'Add to Cart',
    );

Map<String, dynamic> _$AddToCartButtonToJson(AddToCartButton instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemImageUrl': instance.itemImageUrl,
      'itemBasePrice': instance.itemBasePrice,
      'buttonText': instance.buttonText,
    };
