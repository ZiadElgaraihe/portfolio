import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_personal_photo.dart';
import 'package:portfolio/components/open_to_work_widget.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class PersonalPhotoFrame extends StatelessWidget {
  const PersonalPhotoFrame({
    super.key,
    required this.isOpenToWork,
  });

  final bool isOpenToWork;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPersonalPhoto(
          height: (context.isDesktop || context.isLargeDesktop) ? 500 : 363,
          width: (context.isDesktop || context.isLargeDesktop) ? 400 : 290,
          borderRadius: 20,
        ),
        if (isOpenToWork)
          Positioned(
            left: 16,
            bottom: 16,
            right: (context.isDesktop || context.isLargeDesktop) ? null : 16,
            child: OpenToWorkWidget(),
          ),
      ],
    );
  }
}
