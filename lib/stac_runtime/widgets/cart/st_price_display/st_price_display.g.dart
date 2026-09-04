// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_price_display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StPriceDisplay _$StPriceDisplayFromJson(Map<String, dynamic> json) =>
    StPriceDisplay(
      stateKey: json['stateKey'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      sizePrices: (json['sizePrices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      addonPrices: (json['addonPrices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$StPriceDisplayToJson(StPriceDisplay instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'basePrice': instance.basePrice,
      'sizePrices': instance.sizePrices,
      'addonPrices': instance.addonPrices,
      'type': instance.type,
    };
