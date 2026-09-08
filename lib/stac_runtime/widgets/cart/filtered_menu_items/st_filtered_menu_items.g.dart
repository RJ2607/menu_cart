// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_filtered_menu_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteredMenuItems _$FilteredMenuItemsFromJson(Map<String, dynamic> json) =>
    FilteredMenuItems(
      child: json['child'] == null
          ? null
          : StacWidget.fromJson(json['child'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilteredMenuItemsToJson(FilteredMenuItems instance) =>
    <String, dynamic>{
      'child': instance.child?.toJson(),
      'type': instance.type,
    };
