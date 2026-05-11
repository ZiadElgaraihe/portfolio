import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/custom_animated_container.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/models/skill_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/technical_skills_extension.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skill,
  });

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      padding: EdgeInsets.all(24),
      borderRadius: BorderRadius.circular(12),
      transform: (isHovered) =>
          Matrix4.identity()..translateByDouble(0, isHovered ? -10 : 0, 0, 1),
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 56,
            width: 56,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.darlington.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.ebonyClay,
                width: 1,
              ),
            ),
            child: SvgPicture.asset(
              skill.icon ?? AppIcons.code,
              colorFilter: (skill.icon == null)
                  ? ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcATop,
                    )
                  : null,
            ),
          ),
          Text(
            skill.name.displayName,
            style: AppTextStyles.bold11.copyWith(
              letterSpacing: 1.3,
            ),
          ),
        ],
      ),
      builder: (context, isHovered, child) => child!,
    );
  }
}
