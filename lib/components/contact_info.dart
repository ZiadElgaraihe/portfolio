import 'package:flutter/material.dart';
import 'package:portfolio/components/personal_contact_info_list_tile.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ready to build something remarkable?",
          style: AppTextStyles.bold32,
        ),
        Text(
          "I am currently open to high-end freelance projects or joining innovative teams full-time. Drop a message and let’s discuss how I can add value.",
          style: AppTextStyles.regular18.copyWith(
            color: AppColors.submarine,
            fontFamily: AppFonts.secondary,
          ),
        ),
        SizedBox(height: 8),
        PersonalContactInfoListTile(
          icon: AppIcons.at,
          subtitle: AppStrings.contactEmail,
          title: "EMAIL",
        ),
        PersonalContactInfoListTile(
          icon: AppIcons.phone,
          subtitle: AppStrings.contactPhone,
          title: "PHONE",
        ),
        PersonalContactInfoListTile(
          icon: AppIcons.location,
          subtitle: AppStrings.contactLocation,
          title: "LOCATION",
        ),
      ],
    );
  }
}
