import 'package:flutter/material.dart';

import './screen_builder.dart';

class RouteNames {
  static const onboardingScreen = '/onboarding';
  static const searchScreen = '/search';
  static const generalScreen = '/general';
}

class MainNavigation {
  static final screenBuilder = ScreenBuilder();

  final routes = <String, Widget Function(BuildContext)>{
    RouteNames.onboardingScreen: (_) => screenBuilder.buildOnboardingScreen(),
    RouteNames.searchScreen: (_) => screenBuilder.buildSearchScreen(),
    RouteNames.generalScreen: (_) => screenBuilder.buildGeneralTabsScreen(),
  };
}
