import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class PersonalContactInfoListTile extends StatelessWidget {
  const PersonalContactInfoListTile({
    super.key,
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  final String icon;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.ebonyClay,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcATop,
          ),
        ),
      ),
      title: Text(title),
      titleTextStyle: AppTextStyles.bold12.copyWith(
        color: AppColors.darlington,
      ),
      subtitle: SelectableText(subtitle),
      subtitleTextStyle: AppTextStyles.regular18.copyWith(
        color: AppColors.white,
        fontFamily: AppFonts.secondary,
      ),
    );
  }
}
