import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_screen.dart';
import 'followers_screen.dart';
import 'profile_screen.dart';

import '../../constants/colors.dart';

class GeneralTabScreen extends StatefulWidget {
  const GeneralTabScreen({Key? key}) : super(key: key);

  @override
  State<GeneralTabScreen> createState() => _GeneralTabScreenState();
}

class _GeneralTabScreenState extends State<GeneralTabScreen> {
  int _selectedIndex = 0;

  void _onNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = [
    HomeScreen(),
    FollowersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final langs = AppLocalizations.of(context)!;
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryText,
        unselectedItemColor: AppColors.unselectedTab,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) => _onNavigationTap(value),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: langs.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups_rounded),
            label: langs.followers,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: langs.profile,
          ),
        ],
      ),
    );
  }
}
