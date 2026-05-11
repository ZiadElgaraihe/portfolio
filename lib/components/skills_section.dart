import 'package:flutter/material.dart';
import 'package:portfolio/components/section_title.dart';
import 'package:portfolio/components/skill_card.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/models/skill_model.dart';
import 'package:portfolio/utils/enums/technical_skills.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<SkillModel> _skills = <SkillModel>[
    SkillModel(icon: AppIcons.dart, name: TechnicalSkills.dart),
    SkillModel(name: TechnicalSkills.oop),
    SkillModel(icon: AppIcons.flutter, name: TechnicalSkills.flutter),
    SkillModel(name: TechnicalSkills.restApis),
    SkillModel(icon: AppIcons.firebase, name: TechnicalSkills.firebase),
    SkillModel(name: TechnicalSkills.cleanArchitecture),
    SkillModel(name: TechnicalSkills.mvvm),
    SkillModel(icon: AppIcons.bloc, name: TechnicalSkills.bloc),
    SkillModel(name: TechnicalSkills.solid),
    SkillModel(icon: AppIcons.git, name: TechnicalSkills.git),
    SkillModel(icon: AppIcons.github, name: TechnicalSkills.github),
    SkillModel(name: TechnicalSkills.responsiveDesign),
    SkillModel(icon: AppIcons.postman, name: TechnicalSkills.postman),
    SkillModel(icon: AppIcons.figma, name: TechnicalSkills.figma),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Technical Skills"),
        SizedBox(height: 48),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: List.generate(
            _skills.length,
            (index) => SkillCard(skill: _skills[index]),
          ),
        ),
        SizedBox(height: AppSizes.sectionBottomSpace),
      ],
    );
  }
}
