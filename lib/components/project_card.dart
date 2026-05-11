import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_animated_container.dart';
import 'package:portfolio/components/project_link_button.dart';
import 'package:portfolio/components/project_technical_skill_widget.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_fonts.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      padding: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(16),
      transform: (isHovered) =>
          Matrix4.identity()..translateByDouble(0, isHovered ? -10 : 0, 0, 1),
      child: _buildProjectInfo(),
      builder: (context, isHovered, child) => Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 379,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: AnimatedScale(
                scale: isHovered ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                child: Image.asset(project.image),
              ),
            ),
          ),
          Expanded(child: child!),
        ],
      ),
    );
  }

  Widget _buildProjectInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      project.name,
                      style: AppTextStyles.medium24.copyWith(
                        height: 1,
                      ),
                    ),
                    if (!project.isCompleted)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "In Progress",
                          style: AppTextStyles.bold11.copyWith(
                            color: AppColors.electricity,
                            fontFamily: AppFonts.secondary,
                          ),
                        ),
                      ),
                  ],
                ),
                Text(
                  project.description,
                  style: AppTextStyles.regular16.copyWith(
                    color: AppColors.submarine,
                    fontFamily: AppFonts.secondary,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.technicalSkills.isNotEmpty)
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: project.technicalSkills
                        .map(
                          (skill) => ProjectTechnicalSkillWidget(
                            skill: skill,
                          ),
                        )
                        .toList(),
                  ),
                Expanded(child: SizedBox(height: 20)),
                if (project.links.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.links
                        .map((e) => ProjectLinkButton(link: e))
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
