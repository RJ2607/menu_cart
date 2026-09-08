// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_menu_item_list_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StMenuItemListBuilder _$StMenuItemListBuilderFromJson(
        Map<String, dynamic> json) =>
    StMenuItemListBuilder(
      items: (json['items'] as List<dynamic>)
          .map((e) => Map<String, dynamic>.from(e as Map))
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
      'type': instance.type,
      'items': instance.items,
      'itemTemplate': instance.itemTemplate.toJson(),
      if (instance.sectionHeaderTemplate != null)
        'sectionHeaderTemplate': instance.sectionHeaderTemplate,
      if (instance.emptyWidget != null)
        'emptyWidget': instance.emptyWidget!.toJson(),
      if (instance.spacing != null) 'spacing': instance.spacing,
    };
