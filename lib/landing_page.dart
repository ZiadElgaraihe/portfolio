import 'package:flutter/material.dart';
import 'package:portfolio/components/about_section.dart';
import 'package:portfolio/components/contact_section.dart';
import 'package:portfolio/components/custom_app_bar.dart';
import 'package:portfolio/components/experience_section.dart';
import 'package:portfolio/components/footer_section.dart';
import 'package:portfolio/components/home_section.dart';
import 'package:portfolio/components/mobile_drawer.dart';
import 'package:portfolio/components/projects_section.dart';
import 'package:portfolio/components/skills_section.dart';
import 'package:portfolio/constants/app_links.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/models/section_model.dart';
import 'package:portfolio/utils/enums/section_types.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';
import 'package:portfolio/utils/functions/open_link.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final ValueNotifier<int> _currentSectionIndex;
  late final ScrollController _scrollController;
  late final List<SectionModel> _sections;

  @override
  void initState() {
    super.initState();
    _currentSectionIndex = ValueNotifier<int>(0);
    _sections = [
      SectionModel(
        appBartitle: "Home",
        sectionType: SectionTypes.home,
        widget: HomeSection(
          onElevatedButtonPressed: _downloadCV,
          onOutlinedButtonPressed: () {
            //todo Change the index if you re-arrange the project section
            _scrollToSection(_sections[3].key);
          },
        ),
      ),
      SectionModel(
        appBartitle: "About",
        sectionType: SectionTypes.about,
        widget: AboutSection(
          isOpenToWork: true,
        ),
      ),
      SectionModel(
        appBartitle: "Experience",
        sectionType: SectionTypes.experience,
        widget: ExperienceSection(),
      ),
      SectionModel(
        appBartitle: "Projects",
        sectionType: SectionTypes.projects,
        widget: ProjectsSection(),
      ),
      SectionModel(
        appBartitle: "Skills",
        sectionType: SectionTypes.skills,
        widget: SkillsSection(),
      ),
      SectionModel(
        appBartitle: "Contact",
        sectionType: SectionTypes.contact,
        widget: ContactSection(),
      ),
    ];
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _currentSectionIndex.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sections.length; i++) {
      final context = _sections[i].key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position <= 100 && position >= -box.size.height + 100) {
          if (_currentSectionIndex.value != i) {
            _currentSectionIndex.value = i;
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        currentSectionIndex: _currentSectionIndex,
        onDownloadCvPressed: _downloadCV,
        onSectionButtonPressed: _scrollToSection,
        sections: _sections,
      ),
      endDrawer: (context.isMobile || context.isTablet)
          ? MobileDrawer(
              currentSectionIndex: _currentSectionIndex,
              onDownloadCvPressed: _downloadCV,
              onSectionButtonPressed: _scrollToSection,
              sections: _sections,
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ..._sections.map(
              (section) => Padding(
                key: section.key,
                padding: AppSizes.bodyHorizontalPadding(context),
                child: section.widget,
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadCV() async {
    await openLink(AppLinks.cv);
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
