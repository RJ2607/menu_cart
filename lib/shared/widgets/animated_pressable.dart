import 'package:flutter/material.dart';

/// A wrapper widget that adds press animation effects to any child widget.
/// Perfect for making cards, list items, and other interactive elements feel more responsive.
class AnimatedPressable extends StatefulWidget {
  const AnimatedPressable({
    Key? key,
    required this.child,
    required this.onTap,
    this.scaleMin = 0.95,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.easeInOut,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final double scaleMin;
  final Duration duration;
  final Curve curve;
  final bool enabled;

  @override
  State<AnimatedPressable> createState() => _AnimatedPressableState();
}

class _AnimatedPressableState extends State<AnimatedPressable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleMin).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.enabled) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enabled) {
      _controller.reverse();
      widget.onTap();
    }
  }

  void _handleTapCancel() {
    if (widget.enabled) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}

/// A wrapper that adds ripple effect with scale animation for cards
class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    Key? key,
    required this.child,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.elevation = 2,
    this.shadowColor,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final double elevation;
  final Color? shadowColor;
  final bool enabled;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: widget.elevation, end: widget.elevation + 4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AnimatedBuilder(
        animation: _elevationAnimation,
        builder: (context, child) {
          return Material(
            elevation: _elevationAnimation.value,
            borderRadius: widget.borderRadius,
            shadowColor: widget.shadowColor ?? Colors.black.withValues(alpha: 0.1),
            child: InkWell(
              onTap: widget.enabled ? widget.onTap : null,
              onTapDown: widget.enabled ? (_) => _controller.forward() : null,
              onTapUp: widget.enabled ? (_) => _controller.reverse() : null,
              onTapCancel: widget.enabled ? () => _controller.reverse() : null,
              borderRadius: widget.borderRadius,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
