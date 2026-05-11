import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

abstract class AppThemes {
  static ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.tertiary,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.windsorBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.horizontal(
          start: Radius.circular(36),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.windsorBlue,
      titleTextStyle: AppTextStyles.bold20.copyWith(
        fontFamily: AppFonts.primary,
        color: AppColors.white,
      ),
      shape: Border(
        bottom: BorderSide(color: AppColors.ebonyClay, width: 1),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.neutral,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: AppFonts.primary,
        color: AppColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        foregroundColor: AppColors.deepBlueGreen,
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.primary.withValues(alpha: 0.5),
        textStyle: AppTextStyles.bold12.copyWith(
          fontFamily: AppFonts.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.3),
        disabledForegroundColor: AppColors.white.withValues(alpha: 0.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.bold12.copyWith(
          fontFamily: AppFonts.primary,
        ),
        side: BorderSide(
          color: AppColors.primary,
          width: 0.75,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style:
          TextButton.styleFrom(
            overlayColor: Colors.transparent,
            textStyle: AppTextStyles.regular14.copyWith(
              fontFamily: AppFonts.primary,
            ),
          ).copyWith(
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.hovered)) {
                  return AppColors.white;
                }
                return AppColors.darlington;
              },
            ),
          ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.tertiary,
      hoverColor: Colors.transparent,
      hintStyle: AppTextStyles.regular16.copyWith(
        color: AppColors.darlington.withValues(alpha: 0.6),
        fontFamily: AppFonts.secondary,
      ),
      errorStyle: AppTextStyles.regular12.copyWith(
        color: AppColors.red,
        fontFamily: AppFonts.secondary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.ebonyClay,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
