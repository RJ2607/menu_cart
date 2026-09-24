import 'package:flutter/material.dart';
import 'package:stac/stac.dart';

import '../animation_config/st_animation.dart';
import '../animation_config/st_animation_config.dart';
import 'st_animated_transition.dart';

class StAnimatedTransitionParser extends StacParser<StAnimatedTransition> {
  const StAnimatedTransitionParser();

  @override
  String get type => 'animated_transition';

  @override
  StAnimatedTransition getModel(Map<String, dynamic> json) =>
      StAnimatedTransition.fromJson(json);

  @override
  Widget parse(BuildContext context, StAnimatedTransition model) {
    final child =
        Stac.fromJson(model.child.toJson(), context) ?? const SizedBox.shrink();
    return _AnimatedTransitionEntry(
      duration: Duration(milliseconds: model.durationMs),
      delay: Duration(milliseconds: model.delayMs),
      curve: stAnimationCurve(model.curve),
      config: StacAnimationConfig(
        durationMs: model.durationMs,
        curve: model.curve,
        delayMs: model.delayMs,
        opacityBegin: model.opacityBegin,
        opacityEnd: model.opacityEnd,
        scaleBegin: model.scaleBegin,
        scaleEnd: model.scaleEnd,
        offsetBeginX: model.offsetBeginX,
        offsetBeginY: model.offsetBeginY,
        offsetEndX: model.offsetEndX,
        offsetEndY: model.offsetEndY,
      ),
      child: child,
    );
  }
}

class _AnimatedTransitionEntry extends StatefulWidget {
  const _AnimatedTransitionEntry({
    required this.child,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.config,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final StacAnimationConfig config;

  @override
  State<_AnimatedTransitionEntry> createState() =>
      _AnimatedTransitionEntryState();
}

class _AnimatedTransitionEntryState extends State<_AnimatedTransitionEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      stAnimatedChild(widget.child, _animation, widget.config);
}
