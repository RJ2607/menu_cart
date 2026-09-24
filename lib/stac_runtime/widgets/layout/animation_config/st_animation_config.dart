import 'package:json_annotation/json_annotation.dart';

import '../../../../enums/st_enums/st_curves.dart';

part 'st_animation_config.g.dart';

/// JSON-friendly animation settings shared by Stac widgets.
///
/// Curves are represented by names such as `easeOutCubic`, `easeInCubic`, or
/// `easeOutBack`. Unknown curves safely fall back to `easeOutCubic`.
@JsonSerializable()
class StacAnimationConfig {
  const StacAnimationConfig({
    this.durationMs = 220,
    this.curve = StCurves.easeOutCubic,
    this.outCurve,
    this.delayMs = 0,
    this.opacityBegin = 0,
    this.opacityEnd = 1,
    this.scaleBegin = 1,
    this.scaleEnd = 1,
    this.offsetBeginX = 0,
    this.offsetBeginY = 0,
    this.offsetEndX = 0,
    this.offsetEndY = 0,
  });

  final int durationMs;
  final StCurves curve;
  final StCurves? outCurve;
  final int delayMs;
  final double opacityBegin;
  final double opacityEnd;
  final double scaleBegin;
  final double scaleEnd;
  final double offsetBeginX;
  final double offsetBeginY;
  final double offsetEndX;
  final double offsetEndY;

  factory StacAnimationConfig.fromJson(Map<String, dynamic> json) =>
      _$StacAnimationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$StacAnimationConfigToJson(this);
}
