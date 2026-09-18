// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_clear_festive_offer_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StClearFestiveOfferAction _$StClearFestiveOfferActionFromJson(
        Map<String, dynamic> json) =>
    StClearFestiveOfferAction(
      showToast: json['showToast'] as bool? ?? true,
      navigateTo: json['navigateTo'] as String?,
    );

Map<String, dynamic> _$StClearFestiveOfferActionToJson(
        StClearFestiveOfferAction instance) =>
    <String, dynamic>{
      'showToast': instance.showToast,
      'navigateTo': instance.navigateTo,
      'actionType': instance.actionType,
    };
