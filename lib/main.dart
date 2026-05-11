import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/landing_page.dart';
import 'package:portfolio/themes/app_themes.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.materialAppTitle,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.dark,
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
