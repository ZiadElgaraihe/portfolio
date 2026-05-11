import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class OpenToWorkWidget extends StatelessWidget {
  const OpenToWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(
              alpha: 0.2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Flexible(
                child: Text(
                  'AVAILABLE FOR NEW OPPORTUNITIES',
                  style: AppTextStyles.bold12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
