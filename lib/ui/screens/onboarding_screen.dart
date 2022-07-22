import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../navigation/main_navigation.dart';
import '../providers/app_state_provider.dart';

import '../../constants/strings.dart';

import '../widgets/onboarding_screen/onboarding_body.dart';
import '../widgets/onboarding_screen/onboarding_pagination.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final langs = AppLocalizations.of(context)!;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Swiper.children(
              loop: false,
              scrollDirection: Axis.horizontal,
              onIndexChanged: (value) => setState(() => pageIndex = value),
              children: <Widget>[
                OnboardingBody(
                  assetName: AppStrings.onboardFirstImage,
                  subtitle: langs.onBoardFirstText,
                ),
                OnboardingBody(
                  assetName: AppStrings.onboardSecondImage,
                  subtitle: langs.onBoardSecondText,
                ),
                OnboardingBody(
                  assetName: AppStrings.onboardThirdImage,
                  subtitle: langs.onBoardThirdText,
                ),
              ],
            ),
          ),
          SizedBox(
            child: OnboardingPagination(
              pageIndex: pageIndex,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: PrimaryButton(
              buttonContent: Text(langs.nextText),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(RouteNames.searchScreen);
                ref.read(sharedPrefsProvider).setFirstLaunched();
              },
              width: deviceSize.width / 2 * 0.75,
              height: deviceSize.width / 2 * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
