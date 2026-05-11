import 'package:flutter/material.dart';
import 'package:portfolio/utils/enums/section_types.dart';

class SectionModel {
  final String appBartitle;
  late GlobalKey _key;
  final SectionTypes sectionType;
  final Widget widget;

  /// The [GlobalKey] is automatically initialized upon object creation.
  /// This key is used to uniquely identify the section's position within
  /// the widget tree, enabling precise scrolling operations.
  SectionModel({
    required this.appBartitle,
    required this.sectionType,
    required this.widget,
  }) {
    _key = GlobalKey();
  }

  GlobalKey get key {
    return _key;
  }
}
