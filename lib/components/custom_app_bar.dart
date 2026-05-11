import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_strings.dart';
import 'package:portfolio/models/section_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.currentSectionIndex,
    required this.onDownloadCvPressed,
    required this.sections,
    required this.onSectionButtonPressed,
  });

  final ValueNotifier<int> currentSectionIndex;
  final VoidCallback onDownloadCvPressed;
  final void Function(GlobalKey key) onSectionButtonPressed;
  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppStrings.myName.toUpperCase(),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      actions: (context.isMobile || context.isTablet)
          ? [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.white,
                ),
              ),
            ]
          : [
              ValueListenableBuilder(
                valueListenable: currentSectionIndex,
                builder: (context, currentIndex, child) => Row(
                  children: List.generate(
                    sections.length,
                    (index) => TextButton(
                      onPressed: () {
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
                      child: IntrinsicWidth(
                        child: Column(
                          spacing: 2,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sections[index].appBartitle,
                              style: AppTextStyles.bold12.copyWith(
                                fontFamily: AppFonts.primary,
                                color: (currentIndex == index)
                                    ? AppColors.primary
                                    : null,
                              ),
                            ),
                            if (currentIndex == index)
                              Container(
                                height: 2,
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 136,
                height: 28,
                child: ElevatedButton(
                  onPressed: onDownloadCvPressed,
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  child: Text('Download CV'),
                ),
              ),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
