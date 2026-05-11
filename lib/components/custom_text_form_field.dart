import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.maxLines,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int? maxLines;
  final String? Function(String? newValue) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTextStyles.bold12.copyWith(
            color: AppColors.neutral,
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.primary,
          cursorHeight: 18,
          validator: validator,
          maxLines: maxLines,
          style: AppTextStyles.regular16.copyWith(
            color: AppColors.white,
            fontFamily: AppFonts.secondary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
