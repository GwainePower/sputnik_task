import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/followers_screen/follower_list.dart';

import '../../constants/colors.dart';

class FollowersScreen extends ConsumerWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = AppLocalizations.of(context)!;
    final themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              langs.followers,
              style: themeData.textTheme.headline3,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_rounded),
                    onPressed: () {},
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  filled: true,
                  fillColor: AppColors.searchBackground,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: '${langs.searchText}...',
                  hintStyle: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 24,
                  ),
                ),
                keyboardType: TextInputType.name,
                style: themeData.textTheme.headline5,
              ),
            ),
            const Expanded(child: FollowerList()),
          ],
        ),
      ),
    );
  }
}
