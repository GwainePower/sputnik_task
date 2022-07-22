import 'package:flutter/material.dart';

import '../screens/general_tab_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/search_screen.dart';

class ScreenBuilder {
  Widget buildOnboardingScreen() => const OnboardingScreen();
  Widget buildSearchScreen() => const SearchScreen();
  Widget buildGeneralTabsScreen() => const GeneralTabScreen();
}
