import 'package:flutter/material.dart';

class MakeSlideAnimation extends StatefulWidget {
  const MakeSlideAnimation({
    Key? key,
    required this.child,
    this.reverse = false,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.easeOut,
  }) : super(key: key);
  
  final Widget child;
  final Duration duration;
  final bool reverse;
  final Curve curve;

  @override
  State<MakeSlideAnimation> createState() => _MakeSlideAnimationState();
}

class _MakeSlideAnimationState extends State<MakeSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation, child: widget.child);
  }
}
