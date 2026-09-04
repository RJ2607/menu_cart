import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({
    super.key,
    required this.child,
    required this.delay,
    this.reverse = false,
  });

  final Widget child;
  final double delay;
  final bool reverse;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (400 * widget.delay).round()),
      vsync: this,
    );

    animation2 = widget.reverse
        ? Tween<double>(
            begin: 30,
            end: 0,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut))
        : Tween<double>(
            begin: -30,
            end: 0,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation2.value),
          child: Opacity(opacity: animation.value, child: widget.child),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
