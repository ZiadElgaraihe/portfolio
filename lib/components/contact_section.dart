import 'package:flutter/material.dart';
import 'package:portfolio/components/contact_button.dart';
import 'package:portfolio/components/contact_form_box.dart';
import 'package:portfolio/components/contact_info.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/constants/social_links.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's Connect",
          style: AppTextStyles.bold32,
        ),
        SizedBox(height: 24),
        (!context.isMobile)
            ? Row(
                spacing: 16,
                children: AppSocialProfiles.profiles
                    .map(
                      (e) => Expanded(
                        child: ContactButton(
                          icon: e.icon,
                          url: e.link,
                          title: e.name,
                        ),
                      ),
                    )
                    .toList(),
              )
            : Column(
                spacing: 16,
                children: [
                  for (int i = 0; i < AppSocialProfiles.profiles.length; i += 2)
                    Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: ContactButton(
                            icon: AppSocialProfiles.profiles[i].icon,
                            url: AppSocialProfiles.profiles[i].link,
                            title: AppSocialProfiles.profiles[i].name,
                          ),
                        ),
                        if (i + 1 < AppSocialProfiles.profiles.length)
                          Expanded(
                            child: ContactButton(
                              icon: AppSocialProfiles.profiles[i + 1].icon,
                              url: AppSocialProfiles.profiles[i + 1].link,
                              title: AppSocialProfiles.profiles[i + 1].name,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
        SizedBox(height: 48),
        (context.isLargeDesktop)
            ? Row(
                spacing: 48,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ContactInfo(),
                  ),
                  Expanded(
                    child: ContactFormBox(),
                  ),
                ],
              )
            : Column(
                spacing: 48,
                children: [
                  ContactInfo(),
                  ContactFormBox(),
                ],
              ),
        SizedBox(height: AppSizes.sectionBottomSpace),
      ],
    );
  }
}
