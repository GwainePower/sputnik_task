import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../navigation/main_navigation.dart';

class SputnikApp extends StatelessWidget {
  static final _mainNavigation = MainNavigation();
  final bool firstLaunched;
  const SputnikApp({
    Key? key,
    required this.firstLaunched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppStrings.montserratFont,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.screenBackground,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.screenBackground,
          foregroundColor: AppColors.primaryText,
          iconTheme: const IconThemeData(size: 28),
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
          headline4: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
          headline5: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 24,
          ),
          headline6: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          subtitle1: TextStyle(
            color: AppColors.subtitleText,
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
          caption: TextStyle(
              color: AppColors.unselectedTab,
              fontWeight: FontWeight.bold,
              fontSize: 13),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              color: AppColors.primaryButtonText,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        errorColor: AppColors.errorText,
      ),
      routes: _mainNavigation.routes,
      initialRoute:
          firstLaunched ? RouteNames.onboardingScreen : RouteNames.searchScreen,
    );
  }
}
