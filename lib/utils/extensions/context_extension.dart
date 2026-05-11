import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_sizes.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  
  double get height => MediaQuery.sizeOf(this).height;

  /// width < 600
  bool get isMobile => width < AppSizes.compactBreakpoint;
  /// 600 ≤ width < 840
  bool get isTablet => width >= AppSizes.compactBreakpoint && width < AppSizes.mediumBreakpoint;
  /// 840 ≤ width < 1200
  bool get isDesktop => width >= AppSizes.mediumBreakpoint && width < AppSizes.expandedBreakpoint;
  /// 1200 ≤ width
  bool get isLargeDesktop => width >= AppSizes.expandedBreakpoint;
}