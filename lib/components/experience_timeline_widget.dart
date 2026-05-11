import 'package:flutter/material.dart';
import 'package:portfolio/components/experience_description.dart';
import 'package:portfolio/components/experience_info.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceTimelineWidget extends StatelessWidget {
  const ExperienceTimelineWidget({
    super.key,
    required this.experience,
    required this.isEvenItem,
  });

  final ExperienceModel experience;
  final bool isEvenItem;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop || context.isLargeDesktop) {
      return _DesktopExperienceTimelineWidget(
        experience: experience,
        isEvenItem: isEvenItem,
      );
    } else {
      return _MobileExperienceTimelineWidget(experience: experience);
    }
  }
}

class _DesktopExperienceTimelineWidget extends StatelessWidget {
  const _DesktopExperienceTimelineWidget({
    required this.experience,
    required this.isEvenItem,
  });

  final ExperienceModel experience;
  final bool isEvenItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.center,
          beforeLineStyle: LineStyle(
            thickness: 1,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          afterLineStyle: LineStyle(
            thickness: 1,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          indicatorStyle: IndicatorStyle(
            height: 24,
            width: 24,
            indicator: Container(
              decoration: BoxDecoration(
                color: experience.isCurrentJob
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.5),
                border: Border.all(
                  color: AppColors.tertiary,
                  width: 4,
                ),
                shape: BoxShape.circle,
                boxShadow: (experience.isCurrentJob)
                    ? [
                        BoxShadow(
                          color: AppColors.primary,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
            ),
          ),
          startChild: Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: (isEvenItem)
                ? ExperienceDescription(description: experience.description)
                : ExperienceInfo(
                    experience: experience,
                    isEvenItem: isEvenItem,
                  ),
          ),
          endChild: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.all(48),
            child: (isEvenItem)
                ? ExperienceInfo(
                    experience: experience,
                    isEvenItem: isEvenItem,
                  )
                : ExperienceDescription(description: experience.description),
          ),
        ),
      ],
    );
  }
}

class _MobileExperienceTimelineWidget extends StatelessWidget {
  const _MobileExperienceTimelineWidget({
    required this.experience,
  });

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.start,
          beforeLineStyle: LineStyle(
            thickness: 1,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          afterLineStyle: LineStyle(
            thickness: 1,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          indicatorStyle: IndicatorStyle(
            height: 24,
            width: 24,
            indicator: Container(
              decoration: BoxDecoration(
                color: experience.isCurrentJob
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.5),
                border: Border.all(
                  color: AppColors.tertiary,
                  width: 4,
                ),
                shape: BoxShape.circle,
                boxShadow: (experience.isCurrentJob)
                    ? [
                        BoxShadow(
                          color: AppColors.primary,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
            ),
          ),
          endChild: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExperienceInfo(
                  experience: experience,
                  isEvenItem: true,
                ),
                ExperienceDescription(description: experience.description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
