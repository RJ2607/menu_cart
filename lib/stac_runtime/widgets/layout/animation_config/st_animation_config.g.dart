// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'st_animation_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacAnimationConfig _$StacAnimationConfigFromJson(Map<String, dynamic> json) =>
    StacAnimationConfig(
      durationMs: (json['durationMs'] as num?)?.toInt() ?? 220,
      curve: $enumDecodeNullable(_$StCurvesEnumMap, json['curve']) ??
          StCurves.easeOutCubic,
      outCurve: $enumDecodeNullable(_$StCurvesEnumMap, json['outCurve']),
      delayMs: (json['delayMs'] as num?)?.toInt() ?? 0,
      opacityBegin: (json['opacityBegin'] as num?)?.toDouble() ?? 0,
      opacityEnd: (json['opacityEnd'] as num?)?.toDouble() ?? 1,
      scaleBegin: (json['scaleBegin'] as num?)?.toDouble() ?? 1,
      scaleEnd: (json['scaleEnd'] as num?)?.toDouble() ?? 1,
      offsetBeginX: (json['offsetBeginX'] as num?)?.toDouble() ?? 0,
      offsetBeginY: (json['offsetBeginY'] as num?)?.toDouble() ?? 0,
      offsetEndX: (json['offsetEndX'] as num?)?.toDouble() ?? 0,
      offsetEndY: (json['offsetEndY'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$StacAnimationConfigToJson(
        StacAnimationConfig instance) =>
    <String, dynamic>{
      'durationMs': instance.durationMs,
      'curve': _$StCurvesEnumMap[instance.curve]!,
      'outCurve': _$StCurvesEnumMap[instance.outCurve],
      'delayMs': instance.delayMs,
      'opacityBegin': instance.opacityBegin,
      'opacityEnd': instance.opacityEnd,
      'scaleBegin': instance.scaleBegin,
      'scaleEnd': instance.scaleEnd,
      'offsetBeginX': instance.offsetBeginX,
      'offsetBeginY': instance.offsetBeginY,
      'offsetEndX': instance.offsetEndX,
      'offsetEndY': instance.offsetEndY,
    };

const _$StCurvesEnumMap = {
  StCurves.bounceIn: 'bounceIn',
  StCurves.bounceInOut: 'bounceInOut',
  StCurves.bounceOut: 'bounceOut',
  StCurves.decelerate: 'decelerate',
  StCurves.ease: 'ease',
  StCurves.easeIn: 'easeIn',
  StCurves.easeInBack: 'easeInBack',
  StCurves.easeInCirc: 'easeInCirc',
  StCurves.easeInCubic: 'easeInCubic',
  StCurves.easeInExpo: 'easeInExpo',
  StCurves.easeInOut: 'easeInOut',
  StCurves.easeInOutBack: 'easeInOutBack',
  StCurves.easeInOutCirc: 'easeInOutCirc',
  StCurves.easeInOutCubic: 'easeInOutCubic',
  StCurves.easeInOutCubicEmphasized: 'easeInOutCubicEmphasized',
  StCurves.easeInOutExpo: 'easeInOutExpo',
  StCurves.easeInOutQuad: 'easeInOutQuad',
  StCurves.easeInOutQuart: 'easeInOutQuart',
  StCurves.easeInOutQuint: 'easeInOutQuint',
  StCurves.easeInOutSine: 'easeInOutSine',
  StCurves.easeInQuad: 'easeInQuad',
  StCurves.easeInQuart: 'easeInQuart',
  StCurves.easeInQuint: 'easeInQuint',
  StCurves.easeInSine: 'easeInSine',
  StCurves.easeInToLinear: 'easeInToLinear',
  StCurves.easeOut: 'easeOut',
  StCurves.easeOutBack: 'easeOutBack',
  StCurves.easeOutCirc: 'easeOutCirc',
  StCurves.easeOutCubic: 'easeOutCubic',
  StCurves.easeOutExpo: 'easeOutExpo',
  StCurves.easeOutQuad: 'easeOutQuad',
  StCurves.easeOutQuart: 'easeOutQuart',
  StCurves.easeOutQuint: 'easeOutQuint',
  StCurves.easeOutSine: 'easeOutSine',
  StCurves.elasticIn: 'elasticIn',
  StCurves.elasticInOut: 'elasticInOut',
  StCurves.elasticOut: 'elasticOut',
  StCurves.fastEaseInToSlowEaseOut: 'fastEaseInToSlowEaseOut',
  StCurves.fastLinearToSlowEaseIn: 'fastLinearToSlowEaseIn',
  StCurves.fastOutSlowIn: 'fastOutSlowIn',
  StCurves.linear: 'linear',
  StCurves.linearToEaseOut: 'linearToEaseOut',
  StCurves.slowMiddle: 'slowMiddle',
};
