// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_cart_summary_builder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeItem _$ChargeItemFromJson(Map<String, dynamic> json) => ChargeItem(
      label: json['label'] as String,
      valueKey: json['valueKey'] as String,
      color: json['color'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] as String?,
      isTotal: json['isTotal'] as bool? ?? false,
    );

Map<String, dynamic> _$ChargeItemToJson(ChargeItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'valueKey': instance.valueKey,
      if (instance.color != null) 'color': instance.color,
      if (instance.fontSize != null) 'fontSize': instance.fontSize,
      if (instance.fontWeight != null) 'fontWeight': instance.fontWeight,
      'isTotal': instance.isTotal,
    };

StCartSummaryBuilder _$StCartSummaryBuilderFromJson(
        Map<String, dynamic> json) =>
    StCartSummaryBuilder(
      chargeItems: (json['chargeItems'] as List<dynamic>)
          .map((e) => ChargeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      actionButton: json['actionButton'] == null
          ? null
          : StacWidget.fromJson(json['actionButton'] as Map<String, dynamic>),
      backgroundColor: json['backgroundColor'] as String?,
      borderTopRadius: (json['borderTopRadius'] as num?)?.toDouble(),
      padding: (json['padding'] as num?)?.toDouble(),
      rowSpacing: (json['rowSpacing'] as num?)?.toDouble(),
      showDivider: json['showDivider'] as bool? ?? true,
      dividerColor: json['dividerColor'] as String?,
    );

Map<String, dynamic> _$StCartSummaryBuilderToJson(
        StCartSummaryBuilder instance) =>
    <String, dynamic>{
      'type': instance.type,
      'chargeItems': instance.chargeItems.map((e) => e.toJson()).toList(),
      if (instance.actionButton != null)
        'actionButton': instance.actionButton!.toJson(),
      if (instance.backgroundColor != null)
        'backgroundColor': instance.backgroundColor,
      if (instance.borderTopRadius != null)
        'borderTopRadius': instance.borderTopRadius,
      if (instance.padding != null) 'padding': instance.padding,
      if (instance.rowSpacing != null) 'rowSpacing': instance.rowSpacing,
      'showDivider': instance.showDivider,
      if (instance.dividerColor != null) 'dividerColor': instance.dividerColor,
    };
