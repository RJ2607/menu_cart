// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_item_selection_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StItemSelectionWrapper _$StItemSelectionWrapperFromJson(
        Map<String, dynamic> json) =>
    StItemSelectionWrapper(
      stateKey: json['stateKey'] as String,
      initialSize: json['initialSize'] as String? ?? 'Regular',
      initialAddons: (json['initialAddons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      child: StacWidget.fromJson(json['child'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StItemSelectionWrapperToJson(
        StItemSelectionWrapper instance) =>
    <String, dynamic>{
      'stateKey': instance.stateKey,
      'initialSize': instance.initialSize,
      'initialAddons': instance.initialAddons,
      'child': instance.child.toJson(),
      'type': instance.type,
    };
