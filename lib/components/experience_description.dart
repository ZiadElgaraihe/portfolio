import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class ExperienceDescription extends StatelessWidget {
  const ExperienceDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.windsorBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.ebonyClay,
          width: 1,
        ),
      ),
      child: Text(
        description,
        style: AppTextStyles.regular14.copyWith(
          color: AppColors.submarine,
          fontFamily: AppFonts.secondary,
        ),
      ),
    );
  }
}
