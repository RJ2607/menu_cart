import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'st_custom_bottom_bar.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
    required this.model,
    required this.currentIndex,
    required this.onTap,
  });
  final StCustomBottomBar model;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> with TickerProviderStateMixin {
  final Map<int, AnimationController> _scaleControllers = {};
  final Map<int, Animation<double>> _scaleAnimations = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.model.labels.length; i++) {
      _scaleControllers[i] = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
      );
      _scaleAnimations[i] = Tween<double>(begin: 1.0, end: 0.85).animate(
        CurvedAnimation(parent: _scaleControllers[i]!, curve: Curves.easeInOut),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _scaleControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: const Color(0xffF5F5F5),
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.model.labels.length, (index) {
          final isSelected = index == widget.currentIndex;
          final isSpecial =
              widget.model.specialIndex != null &&
              index == widget.model.specialIndex;

          final icon = AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: isSelected ? Colors.black : Colors.transparent,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: SvgPicture.asset(
                key: ValueKey('$index-$isSelected'),
                isSelected
                    ? widget.model.svgIcons[index]
                    : widget.model.svgFilledIcons[index],
                semanticsLabel: widget.model.labels[index],
              ),
            ),
          );

          return ScaleTransition(
            scale: _scaleAnimations[index]!,
            child: GestureDetector(
              onTapDown: (_) => _scaleControllers[index]?.forward(),
              onTapUp: (_) {
                _scaleControllers[index]?.reverse();
                widget.onTap(index);
              },
              onTapCancel: () => _scaleControllers[index]?.reverse(),
              child: isSpecial
                  ? Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [icon],
                    )
                  : icon,
            ),
          );
        }),
      ),
    );
  }
}
