import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class FooterCopyright extends StatelessWidget {
  const FooterCopyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: (!context.isMobile)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Text(
          AppStrings.myName.toUpperCase(),
          style: AppTextStyles.bold18.copyWith(
            color: AppColors.primary,
          ),
        ),
        Text(
          "© ${DateTime.now().year} ${AppStrings.myName}. Built with Flutter precision.",
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.darlington,
          ),
          textAlign: (!context.isMobile) ? TextAlign.start : TextAlign.center,
        ),
      ],
    );
  }
}
