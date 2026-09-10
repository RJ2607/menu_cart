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
      'itemTemplate': instance.itemTemplate.toJson(),
      'emptyWidget': instance.emptyWidget?.toJson(),
      'spacing': instance.spacing,
      'headerText': instance.headerText,
      'itemSingular': instance.itemSingular,
      'itemPlural': instance.itemPlural,
      'type': instance.type,
    };
