// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_dynamic_cart_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCartSummary _$DynamicCartSummaryFromJson(Map<String, dynamic> json) =>
    DynamicCartSummary(
      subtotalLabel: json['subtotalLabel'] as String?,
      deliveryLabel: json['deliveryLabel'] as String?,
      totalLabel: json['totalLabel'] as String?,
      placeOrderText: json['placeOrderText'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      subtotalTextColor: json['subtotalTextColor'] as String?,
      subtotalValueColor: json['subtotalValueColor'] as String?,
      deliveryTextColor: json['deliveryTextColor'] as String?,
      deliveryValueColor: json['deliveryValueColor'] as String?,
      totalTextColor: json['totalTextColor'] as String?,
      totalValueColor: json['totalValueColor'] as String?,
      dividerColor: json['dividerColor'] as String?,
      placeOrderButtonColor: json['placeOrderButtonColor'] as String?,
      placeOrderTextColor: json['placeOrderTextColor'] as String?,
      borderTopRadius: (json['borderTopRadius'] as num?)?.toDouble(),
      verticalPadding: (json['verticalPadding'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DynamicCartSummaryToJson(DynamicCartSummary instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.subtotalLabel != null) 'subtotalLabel': instance.subtotalLabel,
      if (instance.deliveryLabel != null) 'deliveryLabel': instance.deliveryLabel,
      if (instance.totalLabel != null) 'totalLabel': instance.totalLabel,
      if (instance.placeOrderText != null)
        'placeOrderText': instance.placeOrderText,
      if (instance.backgroundColor != null)
        'backgroundColor': instance.backgroundColor,
      if (instance.subtotalTextColor != null)
        'subtotalTextColor': instance.subtotalTextColor,
      if (instance.subtotalValueColor != null)
        'subtotalValueColor': instance.subtotalValueColor,
      if (instance.deliveryTextColor != null)
        'deliveryTextColor': instance.deliveryTextColor,
      if (instance.deliveryValueColor != null)
        'deliveryValueColor': instance.deliveryValueColor,
      if (instance.totalTextColor != null)
        'totalTextColor': instance.totalTextColor,
      if (instance.totalValueColor != null)
        'totalValueColor': instance.totalValueColor,
      if (instance.dividerColor != null) 'dividerColor': instance.dividerColor,
      if (instance.placeOrderButtonColor != null)
        'placeOrderButtonColor': instance.placeOrderButtonColor,
      if (instance.placeOrderTextColor != null)
        'placeOrderTextColor': instance.placeOrderTextColor,
      if (instance.borderTopRadius != null)
        'borderTopRadius': instance.borderTopRadius,
      if (instance.verticalPadding != null)
        'verticalPadding': instance.verticalPadding,
    };
