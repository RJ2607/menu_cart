import 'package:flutter/material.dart';

import '../../../../enums/st_enums/st_curve_parser.dart';
import '../../../../enums/st_enums/st_curves.dart';
import 'st_animation_config.dart';

/// Resolves a Stac curve enum to the matching Flutter curve.
Curve stAnimationCurve(StCurves? curve) {
  return (curve ?? StCurves.easeOutCubic).parse;
}

Duration stAnimationDuration(
  StacAnimationConfig? config, {
  int fallbackMs = 220,
}) {
  return Duration(milliseconds: config?.durationMs ?? fallbackMs);
}

Animation<double> _stValue(Animation<double> parent, double begin, double end) {
  return Tween<double>(begin: begin, end: end).animate(parent);
}

Widget stAnimatedChild(
  Widget child,
  Animation<double> animation,
  StacAnimationConfig? config, {
  bool reverse = false,
}) {
  final effectiveConfig = config;
  if (effectiveConfig == null) return child;

  final beginOpacity = reverse
      ? effectiveConfig.opacityEnd
      : effectiveConfig.opacityBegin;
  final endOpacity = reverse
      ? effectiveConfig.opacityBegin
      : effectiveConfig.opacityEnd;
  final beginScale = reverse
      ? effectiveConfig.scaleEnd
      : effectiveConfig.scaleBegin;
  final endScale = reverse
      ? effectiveConfig.scaleBegin
      : effectiveConfig.scaleEnd;
  final beginOffset = reverse
      ? Offset(effectiveConfig.offsetEndX, effectiveConfig.offsetEndY)
      : Offset(effectiveConfig.offsetBeginX, effectiveConfig.offsetBeginY);
  final endOffset = reverse
      ? Offset(effectiveConfig.offsetBeginX, effectiveConfig.offsetBeginY)
      : Offset(effectiveConfig.offsetEndX, effectiveConfig.offsetEndY);

  return FadeTransition(
    opacity: _stValue(animation, beginOpacity, endOpacity),
    child: ScaleTransition(
      scale: _stValue(animation, beginScale, endScale),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}

/// Builds a transition suitable for an `AnimatedSwitcher` child.
Widget stSwitchTransition(
  Widget child,
  Animation<double> animation,
  StacAnimationConfig? config,
) {
  return stAnimatedChild(child, animation, config);
}
