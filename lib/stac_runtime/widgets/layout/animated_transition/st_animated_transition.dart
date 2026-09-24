import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

import '../../../../enums/st_enums/st_curves.dart';

part 'st_animated_transition.g.dart';

/// A generic JSON-configurable entrance animation for any Stac child.
@JsonSerializable(explicitToJson: true)
class StAnimatedTransition extends StacWidget {
  const StAnimatedTransition({
    required this.child,
    this.durationMs = 300,
    this.curve = StCurves.easeOutCubic,
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

  final StacWidget child;
  final int durationMs;
  final StCurves curve;
  final int delayMs;
  final double opacityBegin;
  final double opacityEnd;
  final double scaleBegin;
  final double scaleEnd;
  final double offsetBeginX;
  final double offsetBeginY;
  final double offsetEndX;
  final double offsetEndY;

  @override
  String get type => 'animated_transition';

  factory StAnimatedTransition.fromJson(Map<String, dynamic> json) =>
      _$StAnimatedTransitionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StAnimatedTransitionToJson(this);
}
