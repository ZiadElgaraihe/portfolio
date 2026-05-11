import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bold32,
          ),
          Container(
            height: 4,
            width: 80,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
