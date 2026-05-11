import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/smooth_scroll_indicator.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.onElevatedButtonPressed,
    required this.onOutlinedButtonPressed,
  });

  final VoidCallback onElevatedButtonPressed;
  final VoidCallback onOutlinedButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      constraints: BoxConstraints(
        minHeight: context.height - kToolbarHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.jobTitle.toUpperCase(),
            style: AppTextStyles.bold12.copyWith(
              color: AppColors.primary,
              letterSpacing: context.isMobile ? 4.0 : 7.5,
            ),
          ),
          SizedBox(height: 8),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) =>
                LinearGradient(
                  colors: [
                    AppColors.white,
                    AppColors.primary,
                  ],
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
            child: Text(
              AppStrings.homeTitle,
              textAlign: TextAlign.center,
              style: (context.isMobile ? AppTextStyles.bold40 : AppTextStyles.bold64)
                  .copyWith(
                    color: AppColors.primary,
                    height: 1.15,
                  ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            AppStrings.homeSubtitle,
            textAlign: TextAlign.center,
            style:
                (context.isMobile ? AppTextStyles.regular16 : AppTextStyles.regular18)
                    .copyWith(
                      fontFamily: AppFonts.secondary,
                      color: AppColors.submarine,
                    ),
          ),
          SizedBox(height: 36),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onElevatedButtonPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(225, 48),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Text('View & Download CV'),
                    SvgPicture.asset(AppIcons.download),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: onOutlinedButtonPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(153, 48),
                ),
                child: Text('Recent Work'),
              ),
            ],
          ),
          SizedBox(height: 48),
          SmoothScrollIndicator(),
          SizedBox(height: AppSizes.sectionBottomSpace),
        ],
      ),
    );
  }
}
