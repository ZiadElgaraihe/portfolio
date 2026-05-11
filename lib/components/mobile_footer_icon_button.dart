import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/utils/functions/open_link.dart';

class MobileFooterIconButton extends StatelessWidget {
  const MobileFooterIconButton({
    super.key,
    required this.icon,
    required this.link,
  });

  final String icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.09),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          openLink(link);
        },
        icon: SvgPicture.asset(
          icon,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(
            AppColors.white,
            BlendMode.srcATop,
          ),
        ),
      ),
    );
  }
}
