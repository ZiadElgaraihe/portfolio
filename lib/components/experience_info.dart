import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class ExperienceInfo extends StatelessWidget {
  const ExperienceInfo({
    super.key,
    required this.experience,
    required this.isEvenItem,
  });

  final ExperienceModel experience;
  final bool isEvenItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isEvenItem
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        if (experience.isCurrentJob)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Text(
              "PRESENT",
              style: AppTextStyles.regular11.copyWith(
                color: AppColors.primary,
                fontFamily: AppFonts.secondary,
              ),
            ),
          )
        else
          Text(
            _getExperienceDuration(),
            style: AppTextStyles.regular11.copyWith(
              color: AppColors.darlington,
            ),
          ),
        Text(
          experience.jobTitle,
          style: AppTextStyles.regular20,
        ),
        if (experience.company != null)
          Text(
            "${experience.company!}${_getExperienceLocation()}",
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.primary,
              fontFamily: AppFonts.secondary,
            ),
          ),
      ],
    );
  }

  String _getExperienceLocation() {
    if (experience.location != null) {
      return ", ${experience.location!}";
    }
    return " (Remote)";
  }

  String _getExperienceDuration() {
    return "${_getFormattedDate(date: experience.startDate)} - ${experience.isCurrentJob ? "Present" : _getFormattedDate(date: experience.endDate!)}";
  }

  String _getFormattedDate({required DateTime date}) {
    return DateFormat('MMM yyyy').format(date).toUpperCase();
  }
}
