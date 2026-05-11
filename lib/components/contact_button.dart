import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/functions/open_link.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.icon,
    required this.url,
    required this.title,
  });

  final String icon;
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.windsorBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.ebonyClay,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            openLink(url);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.09),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyles.bold11.copyWith(
                    letterSpacing: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
