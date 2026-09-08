// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_cart_item_list_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StCartItemListBuilder _$StCartItemListBuilderFromJson(
        Map<String, dynamic> json) =>
    StCartItemListBuilder(
      itemTemplate:
          StacWidget.fromJson(json['itemTemplate'] as Map<String, dynamic>),
      emptyWidget: json['emptyWidget'] == null
          ? null
          : StacWidget.fromJson(json['emptyWidget'] as Map<String, dynamic>),
      spacing: (json['spacing'] as num?)?.toDouble(),
      headerText: json['headerText'] as String?,
      itemSingular: json['itemSingular'] as String?,
      itemPlural: json['itemPlural'] as String?,
    );

Map<String, dynamic> _$StCartItemListBuilderToJson(
        StCartItemListBuilder instance) =>
    <String, dynamic>{
      'type': instance.type,
      'itemTemplate': instance.itemTemplate.toJson(),
      if (instance.emptyWidget != null)
        'emptyWidget': instance.emptyWidget!.toJson(),
      if (instance.spacing != null) 'spacing': instance.spacing,
      if (instance.headerText != null) 'headerText': instance.headerText,
      if (instance.itemSingular != null) 'itemSingular': instance.itemSingular,
      if (instance.itemPlural != null) 'itemPlural': instance.itemPlural,
    };
