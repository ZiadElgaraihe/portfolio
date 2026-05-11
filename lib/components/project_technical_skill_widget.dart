import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/enums/technical_skills.dart';
import 'package:portfolio/utils/extensions/technical_skills_extension.dart';

class ProjectTechnicalSkillWidget extends StatelessWidget {
  const ProjectTechnicalSkillWidget({
    super.key,
    required this.skill,
  });

  final TechnicalSkills skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4.5,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        skill.displayName,
        style: AppTextStyles.bold12.copyWith(
          color: AppColors.primary,
          fontFamily: AppFonts.secondary,
        ),
      ),
    );
  }
}
