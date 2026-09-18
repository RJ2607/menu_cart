// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_festive_offer_picker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestiveOfferPicker _$FestiveOfferPickerFromJson(Map<String, dynamic> json) =>
    FestiveOfferPicker(
      title: json['title'] as String?,
      showCodes: json['showCodes'] as bool? ?? true,
      spacing: (json['spacing'] as num?)?.toDouble(),
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FestiveOfferPickerToJson(FestiveOfferPicker instance) =>
    <String, dynamic>{
      'title': instance.title,
      'showCodes': instance.showCodes,
      'spacing': instance.spacing,
      'borderRadius': instance.borderRadius,
      'type': instance.type,
    };
