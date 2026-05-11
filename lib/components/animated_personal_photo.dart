import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_animated_container.dart';
import 'package:portfolio/constants/app_images.dart';
import 'package:portfolio/themes/app_colors.dart';

class AnimatedPersonalPhoto extends StatelessWidget {
  const AnimatedPersonalPhoto({
    super.key,
    required this.width,
    required this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 0,
  });

  final double width;
  final double height;
  final BoxShape shape;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    const Widget staticImage = BasePersonalImage();

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomAnimatedContainer(
        width: width,
        height: height,
        shape: shape,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.circular(borderRadius),
        border: (isHovered) => Border.all(
          color: isHovered ? AppColors.primary : AppColors.submarine,
          width: 2,
        ),
        child: shape == BoxShape.circle
            ? const ClipOval(child: staticImage)
            : ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius - 2),
                child: staticImage,
              ),

        builder: (context, isHovered, child) => TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween<double>(begin: 0.0, end: isHovered ? 1.0 : 0.0),
          child: child,
          builder: (context, value, animatedChild) {
            return ColorFiltered(
              colorFilter: ColorFilter.matrix(_getSaturationMatrix(value)),
              child: animatedChild!,
            );
          },
        ),
      ),
    );
  }

  List<double> _getSaturationMatrix(double sat) {
    final double r = 0.2126 * (1 - sat);
    final double g = 0.7152 * (1 - sat);
    final double b = 0.0722 * (1 - sat);

    return [
      r + sat,
      g,
      b,
      0,
      0,
      r,
      g + sat,
      b,
      0,
      0,
      r,
      g,
      b + sat,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }
}

class BasePersonalImage extends StatelessWidget {
  const BasePersonalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.personalPhoto,
      fit: BoxFit.cover,
    );
  }
}
