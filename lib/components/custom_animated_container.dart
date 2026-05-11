import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({
    super.key,
    this.border,
    this.borderRadius,
    required this.builder,
    this.child,
    this.height,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.transform,
    this.width,
  });

  final BoxBorder Function(bool isHovered)? border;
  final BorderRadiusGeometry? borderRadius;
  final Widget Function(BuildContext context, bool isHovered, Widget? child)
  builder;
  final Widget? child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BoxShape shape;
  final Matrix4 Function(bool isHovered)? transform;
  final double? width;

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: widget.height,
        width: widget.width,
        transform: widget.transform?.call(_isHovered),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: AppColors.windsorBlue,
          borderRadius: widget.borderRadius,
          border:
              widget.border?.call(_isHovered) ??
              Border.all(
                color: _isHovered ? AppColors.primary : AppColors.ebonyClay,
                width: 1,
              ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 15,
                spreadRadius: 2,
              ),
          ],
          shape: widget.shape,
        ),
        child: widget.builder(context, _isHovered, widget.child),
      ),
    );
  }
}
