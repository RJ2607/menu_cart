// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_cart_preview_bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StCartPreviewBar _$StCartPreviewBarFromJson(Map<String, dynamic> json) =>
    StCartPreviewBar(
      viewLabel: json['viewLabel'] as String?,
      imageSize: (json['imageSize'] as num?)?.toDouble(),
      backgroundColor: json['backgroundColor'] as String?,
      textColor: json['textColor'] as String?,
      accentColor: json['accentColor'] as String?,
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
      previewAnimation: json['previewAnimation'] == null
          ? null
          : StacAnimationConfig.fromJson(
              json['previewAnimation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StCartPreviewBarToJson(StCartPreviewBar instance) =>
    <String, dynamic>{
      'viewLabel': instance.viewLabel,
      'imageSize': instance.imageSize,
      'backgroundColor': instance.backgroundColor,
      'textColor': instance.textColor,
      'accentColor': instance.accentColor,
      'borderRadius': instance.borderRadius,
      'previewAnimation': instance.previewAnimation?.toJson(),
      'type': instance.type,
    };
