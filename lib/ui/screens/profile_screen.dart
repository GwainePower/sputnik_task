import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';

import '../providers/user_provider.dart';

import '../widgets/loading_widget.dart';
import '../widgets/profile_screen/circular_icon.dart';
import '../widgets/profile_screen/option_card.dart';
import '../widgets/profile_screen/user_info_item.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = AppLocalizations.of(context)!;
    final user = ref.watch(searchProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircularIcon(icon: Icons.settings_rounded),
                CircularIcon(icon: Icons.notifications_rounded),
              ],
            ),
            user.when(
              data: (userInfo) => UserInfoItem(user: userInfo),
              error: (error, stackTrace) => Container(),
              loading: () => const LoadingWidget(),
            ),
            OptionCard(
              iconAsset: AppStrings.heartIcon,
              title: langs.myFollowing,
            ),
            OptionCard(
              iconAsset: AppStrings.heartIcon,
              title: langs.myFollowers,
            ),
            OptionCard(
              iconAsset: AppStrings.medalIcon,
              title: langs.myBadges,
            ),
            OptionCard(
              iconAsset: AppStrings.dollarIcon,
              title: langs.myOrganizations,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.secondaryButtonBackground,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(langs.viewAll),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_rounded)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
