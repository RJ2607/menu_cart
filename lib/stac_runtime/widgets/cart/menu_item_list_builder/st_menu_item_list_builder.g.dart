// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_menu_item_list_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StMenuItemListBuilder _$StMenuItemListBuilderFromJson(
        Map<String, dynamic> json) =>
    StMenuItemListBuilder(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      itemTemplate:
          StacWidget.fromJson(json['itemTemplate'] as Map<String, dynamic>),
      sectionHeaderTemplate: json['sectionHeaderTemplate'] as String?,
      emptyWidget: json['emptyWidget'] == null
          ? null
          : StacWidget.fromJson(json['emptyWidget'] as Map<String, dynamic>),
      spacing: (json['spacing'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StMenuItemListBuilderToJson(
        StMenuItemListBuilder instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemTemplate': instance.itemTemplate.toJson(),
      'sectionHeaderTemplate': instance.sectionHeaderTemplate,
      'emptyWidget': instance.emptyWidget?.toJson(),
      'spacing': instance.spacing,
      'type': instance.type,
    };
