import 'package:flutter/material.dart';

class MakeScaleAnimation extends StatefulWidget {
  const MakeScaleAnimation({
    super.key,
    required this.child,
    this.reverse = false,
    this.duration = const Duration(milliseconds: 350),
  });

  final Widget child;
  final bool reverse;
  final Duration duration;

  @override
  State<MakeScaleAnimation> createState() => _MakeScaleAnimationState();
}

class _MakeScaleAnimationState extends State<MakeScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    if (widget.reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
