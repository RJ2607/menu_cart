// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_conditional_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StConditionalContainer _$StConditionalContainerFromJson(
        Map<String, dynamic> json) =>
    StConditionalContainer(
      width: (json['width'] as num?)?.toDouble(),
      widthExpr: const StacSizeExprConverter().fromJson(json['widthExpr']),
      height: (json['height'] as num?)?.toDouble(),
      heightExpr: const StacSizeExprConverter().fromJson(json['heightExpr']),
      padding: json['padding'] == null
          ? null
          : StacEdgeInsets.fromJson(json['padding']),
      margin: json['margin'] == null
          ? null
          : StacEdgeInsets.fromJson(json['margin']),
      alignment: $enumDecodeNullable(_$StacAlignmentEnumMap, json['alignment']),
      when: json['when'],
      decorationWhenTrue: json['decorationWhenTrue'] == null
          ? null
          : StacBoxDecoration.fromJson(
              json['decorationWhenTrue'] as Map<String, dynamic>),
      decorationWhenFalse: json['decorationWhenFalse'] == null
          ? null
          : StacBoxDecoration.fromJson(
              json['decorationWhenFalse'] as Map<String, dynamic>),
      child: json['child'] == null
          ? null
          : StacWidget.fromJson(json['child'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StConditionalContainerToJson(
        StConditionalContainer instance) =>
    <String, dynamic>{
      'width': instance.width,
      'widthExpr': const StacSizeExprConverter().toJson(instance.widthExpr),
      'height': instance.height,
      'heightExpr': const StacSizeExprConverter().toJson(instance.heightExpr),
      'padding': instance.padding?.toJson(),
      'margin': instance.margin?.toJson(),
      'alignment': _$StacAlignmentEnumMap[instance.alignment],
      'when': instance.when,
      'decorationWhenTrue': instance.decorationWhenTrue?.toJson(),
      'decorationWhenFalse': instance.decorationWhenFalse?.toJson(),
      'child': instance.child?.toJson(),
      'type': instance.type,
    };

const _$StacAlignmentEnumMap = {
  StacAlignment.topLeft: 'topLeft',
  StacAlignment.topCenter: 'topCenter',
  StacAlignment.topRight: 'topRight',
  StacAlignment.centerLeft: 'centerLeft',
  StacAlignment.center: 'center',
  StacAlignment.centerRight: 'centerRight',
  StacAlignment.bottomLeft: 'bottomLeft',
  StacAlignment.bottomCenter: 'bottomCenter',
  StacAlignment.bottomRight: 'bottomRight',
};
