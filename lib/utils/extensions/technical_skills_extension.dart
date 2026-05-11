import 'package:portfolio/utils/enums/technical_skills.dart';

extension TechnicalSkillsExtension on TechnicalSkills {
  String _formatName() {
    String result = name.replaceAllMapped(RegExp(r'([A-Z])'), (match) {
      return ' ${match.group(0)}';
    });

    return result[0].toUpperCase() + result.substring(1);
  }

  String get displayName {
  switch (this) {
    case TechnicalSkills.oop:
      return 'OOP';
    case TechnicalSkills.bloc:
      return 'BLoC';
    case TechnicalSkills.mvvm:
      return 'MVVM';
    case TechnicalSkills.restApis:
      return 'REST APIs';
    default:
      return _formatName();
  }
}
}