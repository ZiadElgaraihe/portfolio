import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_rich_text.dart';
import 'package:portfolio/components/personal_photo_frame.dart';
import 'package:portfolio/components/section_title.dart';
import 'package:portfolio/constants/app_sizes.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.isOpenToWork,
  });

  final bool isOpenToWork;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop || context.isLargeDesktop) {
      return _DesktopAboutSectionContent(isOpenToWork: isOpenToWork);
    } else {
      return _MobileAboutSectionContent(isOpenToWork: isOpenToWork);
    }
  }
}

class _DesktopAboutSectionContent extends StatelessWidget {
  const _DesktopAboutSectionContent({
    required this.isOpenToWork,
  });

  final bool isOpenToWork;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height - kToolbarHeight,
      constraints: BoxConstraints(minHeight: 600),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PersonalPhotoFrame(
            isOpenToWork: isOpenToWork,
          ),
          SizedBox(width: 24),
          Expanded(
            child: _AboutMeInfo(),
          ),
        ],
      ),
    );
  }
}

class _MobileAboutSectionContent extends StatelessWidget {
  const _MobileAboutSectionContent({
    required this.isOpenToWork,
  });

  final bool isOpenToWork;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PersonalPhotoFrame(
          isOpenToWork: isOpenToWork,
        ),
        SizedBox(height: 24),
        _AboutMeInfo(),
        SizedBox(height: AppSizes.sectionBottomSpace),
      ],
    );
  }
}

class _AboutMeInfo extends StatelessWidget {
  const _AboutMeInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "About Me"),
        SizedBox(height: 24),
        AboutMeRichText(),
      ],
    );
  }
}
