import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class SmoothScrollIndicator extends StatefulWidget {
  const SmoothScrollIndicator({super.key});

  @override
  State<SmoothScrollIndicator> createState() => _SmoothScrollIndicatorState();
}

class _SmoothScrollIndicatorState extends State<SmoothScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Animation duration for a smooth full cycle
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // 1. Position Animation: Moves the capsule from top to bottom
    _positionAnimation = Tween<double>(begin: -10, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // 2. Opacity Animation: Creates a smooth fade-in/fade-out effect
    _opacityAnimation = TweenSequence<double>([
      // Fade In (30% of total time)
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      // Stay visible (40% of total time)
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
      // Fade Out (30% of total time)
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SCROLL',
          style: AppTextStyles.bold12.copyWith(
            color: AppColors.darlington,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 48,
          width: 1,
          clipBehavior: Clip.none,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 0.75,
                color: AppColors.darlington,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    top: _positionAnimation.value,
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: Container(
                        height: 20,
                        width: 1,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
