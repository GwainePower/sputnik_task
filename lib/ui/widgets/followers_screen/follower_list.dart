import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboading_task/ui/providers/followers_provider.dart';
import 'package:onboading_task/ui/widgets/followers_screen/follower_list_tile.dart';

import '../loading_widget.dart';

class FollowerList extends ConsumerWidget {
  const FollowerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    final followers = ref.watch(followersProvider(userName));
    return followers.when(
      data: (followersList) => RefreshIndicator(
        onRefresh: () async => await ref.refresh(followersProvider(userName)),
        child: ListView.builder(
          itemCount: followersList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, i) => FolowerListTile(follower: followersList[i]),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const LoadingWidget(),
    );
  }
}
