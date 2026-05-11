import 'package:flutter/material.dart';
import 'package:portfolio/components/experience_timeline_widget.dart';
import 'package:portfolio/components/section_title.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static final List<ExperienceModel> _experiences = <ExperienceModel>[
    ExperienceModel.current(
      description:
          "Delivered custom Flutter applications for multiple clients, handling full-cycle development from UI to API integration. Focused on building scalable, high-performance apps while ensuring high code quality.",
      startDate: DateTime(2025, 9),
      jobTitle: "Freelance Flutter Developer",
    ),
    ExperienceModel.past(
      description:
          "Contributed to production applications across automotive, EV, and health domains, including systems serving 100K+ users. Built scalable UI, integrated APIs, and improved performance using structured state management and caching strategies.",
      endDate: DateTime(2025, 2),
      startDate: DateTime(2024, 7),
      jobTitle: "Junior Flutter Developer",
      company: "Tecfy",
      location: "Port Said",
    ),
    ExperienceModel.past(
      description:
          "Developed responsive UI from Figma designs and integrated REST APIs with complex data structures. Worked on real-time systems and contributed to OCR-based features, focusing on performance and clean code practices.",
      endDate: DateTime(2024, 1),
      startDate: DateTime(2023, 8),
      jobTitle: "Junior Flutter Developer",
      company: "ASDC",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(title: "Experience"),
        SizedBox(height: 48),
        ...List.generate(
          _experiences.length,
          (index) => ExperienceTimelineWidget(
            experience: _experiences[index],
            isEvenItem: (index + 1).isEven,
          ),
        ),
        SizedBox(height: AppSizes.sectionBottomSpace),
      ],
    );
  }
}
