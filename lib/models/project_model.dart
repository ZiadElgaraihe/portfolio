import 'package:portfolio/utils/enums/project_link_type.dart';
import 'package:portfolio/utils/enums/technical_skills.dart';

class ProjectModel {
  final String description;
  final String image;
  final bool isCompleted;
  final List<ProjectLinkModel> links;
  final String name;
  final List<TechnicalSkills> technicalSkills;

  const ProjectModel({
    required this.description,
    required this.image,
    this.isCompleted = true,
    this.links = const <ProjectLinkModel>[],
    required this.name,
    required this.technicalSkills,
  });
}

class ProjectLinkModel {
  final ProjectLinkType type;
  final String url;

  const ProjectLinkModel({
    required this.type,
    required this.url,
  });
}
