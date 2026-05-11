import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/constants/app_links.dart';
import 'package:portfolio/models/social_model.dart';

abstract class AppSocialProfiles {
  static const List<SocialModel> profiles = [
    SocialModel(name: 'Email', icon: AppIcons.at, link: AppLinks.email),
    SocialModel(name: 'WhatsApp', icon: AppIcons.whatsapp, link: AppLinks.whatsapp),
    SocialModel(name: 'LinkedIn', icon: AppIcons.linkedin, link: AppLinks.linkedin),
    SocialModel(name: 'GitHub', icon: AppIcons.github, link: AppLinks.github),
  ];
}