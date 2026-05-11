import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

abstract class AppSizes {
  /// 600
  static const double compactBreakpoint = 600;

  /// 840
  static const double mediumBreakpoint = 840;

  /// 1200
  static const double expandedBreakpoint = 1200;
  
  /// 64
  static const double sectionBottomSpace = 64;

  ///if width < 600 then padding is 16 horizontally
  ///else then padding is 24 horizontally
  ///
  ///For more information, see the spacing section:
  ///
  ///https://m3.material.io/foundations/layout/applying-layout/compact
  static EdgeInsets bodyHorizontalPadding(BuildContext context) =>
      EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 16
            : 24,
      );
}
