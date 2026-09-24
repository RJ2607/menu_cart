// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_category_chip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StCategoryChip _$StCategoryChipFromJson(Map<String, dynamic> json) =>
    StCategoryChip(
      category: json['category'] as String,
      selectionAnimation: json['selectionAnimation'] == null
          ? null
          : StacAnimationConfig.fromJson(
              json['selectionAnimation'] as Map<String, dynamic>),
      pressAnimation: json['pressAnimation'] == null
          ? null
          : StacAnimationConfig.fromJson(
              json['pressAnimation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StCategoryChipToJson(StCategoryChip instance) =>
    <String, dynamic>{
      'category': instance.category,
      'selectionAnimation': instance.selectionAnimation?.toJson(),
      'pressAnimation': instance.pressAnimation?.toJson(),
      'type': instance.type,
    };
