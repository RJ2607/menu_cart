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
      'subtotalLabel': instance.subtotalLabel,
      'deliveryLabel': instance.deliveryLabel,
      'totalLabel': instance.totalLabel,
      'placeOrderText': instance.placeOrderText,
      'backgroundColor': instance.backgroundColor,
      'subtotalTextColor': instance.subtotalTextColor,
      'subtotalValueColor': instance.subtotalValueColor,
      'deliveryTextColor': instance.deliveryTextColor,
      'deliveryValueColor': instance.deliveryValueColor,
      'totalTextColor': instance.totalTextColor,
      'totalValueColor': instance.totalValueColor,
      'dividerColor': instance.dividerColor,
      'placeOrderButtonColor': instance.placeOrderButtonColor,
      'placeOrderTextColor': instance.placeOrderTextColor,
      'borderTopRadius': instance.borderTopRadius,
      'verticalPadding': instance.verticalPadding,
      'type': instance.type,
    };
