import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final Function() onTap;
  final String? title;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final bool disabled;
  final bool showLoader;
  final bool isOutlined;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? fontSize;
  final Color? loadingColor;
  final BorderSide? borderSide;

  const MainButton({
    Key? key,
    required this.onTap,
    this.disabled = false,
    this.showLoader = false,
    this.isOutlined = false,
    this.title,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.borderRadius = 30,
    this.color,
    this.textColor,
    this.width,
    this.borderSide,
    this.loadingColor = Colors.white,
    this.fontSize,
  }) : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> with SingleTickerProviderStateMixin {
  bool isLoadingButton = false;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.isOutlined
        ? widget.textColor ?? Colors.white
        : widget.color ?? Colors.black;
    if (widget.disabled) {
      color = Colors.black.withValues(alpha: 0.4);
    }
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: color,
        elevation: widget.disabled ? 0 : 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        child: InkWell(
          onTap: widget.disabled
              ? null
              : () async {
                  if (widget.showLoader) {
                    if (!isLoadingButton) {
                      setState(() => isLoadingButton = true);
                      try {
                        await widget.onTap();
                      } finally {
                        if (mounted) setState(() => isLoadingButton = false);
                      }
                    }
                  } else {
                    widget.onTap();
                  }
                },
          onTapDown: widget.disabled ? null : (_) => _scaleController.forward(),
          onTapUp: widget.disabled ? null : (_) => _scaleController.reverse(),
          onTapCancel: widget.disabled ? null : () => _scaleController.reverse(),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            width: widget.width,
            padding: widget.padding,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                side:
                    widget.borderSide ??
                    BorderSide(
                      color: widget.color ?? Colors.black,
                      width: widget.isOutlined ? 1 : 0,
                    ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: widget.showLoader && isLoadingButton
                  ? SizedBox(
                      key: const ValueKey('loading'),
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: widget.loadingColor,
                        strokeCap: StrokeCap.round,
                      ),
                    )
                  : Text(
                      key: const ValueKey('text'),
                      widget.title ?? '',
                      style:
                          widget.textStyle ??
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: widget.isOutlined
                                ? widget.color ?? Colors.black
                                : widget.textColor ?? Colors.white,
                            fontSize: widget.fontSize ?? 16,
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
