// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_apply_festive_offer_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StApplyFestiveOfferAction _$StApplyFestiveOfferActionFromJson(
        Map<String, dynamic> json) =>
    StApplyFestiveOfferAction(
      festiveKey: json['festiveKey'] as String,
      navigateTo: json['navigateTo'] as String?,
      openWildcardPage: json['openWildcardPage'] as String?,
      showToast: json['showToast'] as bool? ?? true,
    );

Map<String, dynamic> _$StApplyFestiveOfferActionToJson(
        StApplyFestiveOfferAction instance) =>
    <String, dynamic>{
      'festiveKey': instance.festiveKey,
      'navigateTo': instance.navigateTo,
      'openWildcardPage': instance.openWildcardPage,
      'showToast': instance.showToast,
      'actionType': instance.actionType,
    };
