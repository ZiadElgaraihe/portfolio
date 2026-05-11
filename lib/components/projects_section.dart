import 'package:flutter/material.dart';
import 'package:portfolio/components/project_card.dart';
import 'package:portfolio/components/section_title.dart';
import 'package:portfolio/constants/app_images.dart';
import 'package:portfolio/constants/app_links.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/utils/enums/project_link_type.dart';
import 'package:portfolio/utils/enums/technical_skills.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<ProjectModel> _projects = <ProjectModel>[
    ProjectModel(
      description:
          "An all-in-one automotive platform offering a marketplace for tires, batteries, and oils, along with on-demand mobile services like refueling and roadside assistance.",
      image: AppImages.kafaratPlus,
      name: "Kafarat Plus",
      technicalSkills: [
        TechnicalSkills.dart,
        TechnicalSkills.oop,
        TechnicalSkills.flutter,
        TechnicalSkills.restApis,
      ],
      links: [
        ProjectLinkModel(
          type: ProjectLinkType.googlePlay,
          url: AppLinks.kafaratGooglePlay,
        ),
        ProjectLinkModel(
          type: ProjectLinkType.website,
          url: AppLinks.kafaratWebsite,
        ),
      ],
    ),
    ProjectModel(
      description:
          "Real-time facility management platform for monitoring, reporting, and alerts.",
      image: AppImages.rasid,
      name: "Rasid",
      technicalSkills: [
        TechnicalSkills.dart,
        TechnicalSkills.oop,
        TechnicalSkills.flutter,
        TechnicalSkills.restApis,
        TechnicalSkills.bloc,
        TechnicalSkills.mvvm,
      ],
      links: [
        ProjectLinkModel(
          type: ProjectLinkType.github,
          url: AppLinks.rasidGithub,
        ),
      ],
    ),
    ProjectModel(
      isCompleted: false,
      description:
          "An all-in-one water tourism marketplace connecting passengers with boat providers through an on-demand booking and real-time bidding system.",
      image: AppImages.sail,
      name: "Sail",
      technicalSkills: [
        TechnicalSkills.dart,
        TechnicalSkills.oop,
        TechnicalSkills.flutter,
        TechnicalSkills.restApis,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Featured Projects"),
        SizedBox(height: 48),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = context.isLargeDesktop
                ? 3
                : context.isDesktop
                ? 2
                : 1;

            List<Widget> rows = [];

            for (int i = 0; i < _projects.length; i += crossAxisCount) {
              final rowItems = _projects.skip(i).take(crossAxisCount).toList();

              rows.add(
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: rowItems.map((project) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth / crossAxisCount,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCard(project: project),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }

            return Column(children: rows);
          },
        ),
        SizedBox(height: AppSizes.sectionBottomSpace - 8),
      ],
    );
  }
}
