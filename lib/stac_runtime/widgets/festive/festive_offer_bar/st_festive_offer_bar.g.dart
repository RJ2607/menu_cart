// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_festive_offer_bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestiveOfferBar _$FestiveOfferBarFromJson(Map<String, dynamic> json) =>
    FestiveOfferBar(
      festiveKey: json['festiveKey'] as String?,
      showWhenNone: json['showWhenNone'] as bool? ?? true,
      compact: json['compact'] as bool? ?? false,
      showRemoveButton: json['showRemoveButton'] as bool? ?? false,
      backgroundColor: json['backgroundColor'] as String?,
      accentColor: json['accentColor'] as String?,
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
      progressAnimation: json['progressAnimation'] == null
          ? null
          : StacAnimationConfig.fromJson(
              json['progressAnimation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FestiveOfferBarToJson(FestiveOfferBar instance) =>
    <String, dynamic>{
      'festiveKey': instance.festiveKey,
      'showWhenNone': instance.showWhenNone,
      'compact': instance.compact,
      'showRemoveButton': instance.showRemoveButton,
      'backgroundColor': instance.backgroundColor,
      'accentColor': instance.accentColor,
      'borderRadius': instance.borderRadius,
      'progressAnimation': instance.progressAnimation?.toJson(),
      'type': instance.type,
    };
