// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_size_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StSizeSelector _$StSizeSelectorFromJson(Map<String, dynamic> json) =>
    StSizeSelector(
      stateKey: json['stateKey'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      initialValue: json['initialValue'] as String?,
    );

Map<String, dynamic> _$StSizeSelectorToJson(StSizeSelector instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'options': instance.options,
      'initialValue': instance.initialValue,
      'type': instance.type,
    };
