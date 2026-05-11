import 'package:flutter/material.dart';
import 'package:portfolio/models/section_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.currentSectionIndex,
    required this.onDownloadCvPressed,
    required this.onSectionButtonPressed,
    required this.sections,
  });

  final ValueNotifier<int> currentSectionIndex;
  final VoidCallback onDownloadCvPressed;
  final void Function(GlobalKey key) onSectionButtonPressed;
  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.width * (3 / 4),
      ),
      child: Drawer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: currentSectionIndex,
                builder: (context, currentIndex, child) => Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    sections.length,
                    (index) => TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onSectionButtonPressed(sections[index].key);
                      },
                      style: TextButton.styleFrom().copyWith(
                        foregroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return AppColors.white;
                                }
                                return AppColors.neutral;
                              },
                            ),
                      ),
                      child: Text(
                        sections[index].appBartitle,
                        style: AppTextStyles.bold12.copyWith(
                          fontFamily: AppFonts.primary,
                          color: (currentIndex == index)
                              ? AppColors.primary
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onDownloadCvPressed,
                  child: const Text("Download CV"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
