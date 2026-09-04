// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_addon_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StAddonSelector _$StAddonSelectorFromJson(Map<String, dynamic> json) =>
    StAddonSelector(
      stateKey: json['stateKey'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      initialSelected: (json['initialSelected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$StAddonSelectorToJson(StAddonSelector instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'options': instance.options,
      'initialSelected': instance.initialSelected,
      'type': instance.type,
    };
