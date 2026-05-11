import 'package:flutter/material.dart';
import 'package:portfolio/components/footer_copyright.dart';
import 'package:portfolio/components/mobile_footer_icon_button.dart';
import 'package:portfolio/constants/social_links.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';
import 'package:portfolio/utils/functions/open_link.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      decoration: BoxDecoration(
        color: Color(0xFF020617),
        border: Border(
          top: BorderSide(color: AppColors.ebonyClay, width: 1),
        ),
      ),
      child: (!context.isMobile)
          ? Row(
              spacing: 8,
              children: [
                Expanded(
                  child: FooterCopyright(),
                ),
                ...AppSocialProfiles.profiles.map(
                  (e) => TextButton(
                    onPressed: () {
                      openLink(e.link);
                    },
                    child: Text(
                      e.name,
                      style: AppTextStyles.regular14,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FooterCopyright(),
                SizedBox(height: 24),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AppSocialProfiles.profiles
                      .map(
                        (e) => MobileFooterIconButton(
                          icon: e.icon,
                          link: e.link,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
    );
  }
}
