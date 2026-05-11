import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/enums/project_link_type.dart';
import 'package:portfolio/utils/functions/open_link.dart';

class ProjectLinkButton extends StatelessWidget {
  const ProjectLinkButton({super.key, required this.link});

  final ProjectLinkModel link;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = _getLinkData();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            openLink(link.url);
          },
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              spacing: 24,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "View on\n$label",
                  style: AppTextStyles.bold12.copyWith(
                    height: 1.1,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  (String, String) _getLinkData() {
    return switch (link.type) {
      ProjectLinkType.github => (AppIcons.github, "GitHub"),
      ProjectLinkType.googlePlay => (AppIcons.googlePlay, "Google Play"),
      ProjectLinkType.appStore => (AppIcons.apple, "App Store"),
      ProjectLinkType.website => (AppIcons.code, "Website"),
    };
  }
}
