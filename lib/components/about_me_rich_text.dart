import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class AboutMeRichText extends StatelessWidget {
  const AboutMeRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Hello! I’m "),
          TextSpan(
            text: "Ziad Elgaraihe",
            style: AppTextStyles.bold20.copyWith(color: AppColors.white),
          ),
          TextSpan(text: ", a passionate Flutter Developer with "),
          TextSpan(
            text: "over 1.5 years of experience ",
            style: AppTextStyles.regular18.copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text:
                "specializing in building and scaling production-ready applications.\nMy expertise lies in delivering end-to-end features for platforms serving ",
          ),
          TextSpan(
            text: "over 100K users",
            style: AppTextStyles.regular18.copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text:
                ", including automotive e-commerce and real-time facility management. I am deeply committed to ",
          ),
          TextSpan(
            text: "Clean Architecture ",
            style: AppTextStyles.regular18.copyWith(color: AppColors.white),
          ),
          TextSpan(
            text: "and ",
          ),
          TextSpan(
            text: "BLoC",
            style: AppTextStyles.regular18.copyWith(color: AppColors.white),
          ),
          TextSpan(
            text:
                ", ensuring that every solution I build is not only responsive across Android, iOS, and Web but also scalable and maintainable.",
          ),
        ],
        style: AppTextStyles.regular18.copyWith(
          color: AppColors.submarine,
          fontFamily: AppFonts.secondary,
          height: 1.75,
        ),
      ),
      textAlign: TextAlign.start,
    );
  }
}
