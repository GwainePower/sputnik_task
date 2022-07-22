import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'category_title.dart';
import 'follower_item.dart';
import '../loading_widget.dart';

import '../../providers/followers_provider.dart';

class FollowersList extends ConsumerWidget {
  const FollowersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = AppLocalizations.of(context)!;
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    final followers = ref.watch(followersProvider(userName));
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CategoryTitle(titleText: langs.followingYouTitle),
        followers.when(
          data: (followersList) => Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            height: deviceSize.height * 0.25,
            child: ListView.builder(
              itemCount: followersList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => FollowerItem(follower: followersList[i]),
            ),
          ),
          error: (error, stackTrace) => Container(),
          loading: () => const LoadingWidget(),
        ),
        const Divider(thickness: 1)
      ],
    );
  }
}
