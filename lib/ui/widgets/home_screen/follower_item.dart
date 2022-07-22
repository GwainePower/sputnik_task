import 'package:flutter/material.dart';

import '../../../domain/models/github_user.dart';

class FollowerItem extends StatelessWidget {
  final GithubUser follower;
  const FollowerItem({
    Key? key,
    required this.follower,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: deviceSize.width * 0.15,
            backgroundImage: NetworkImage(follower.avatarUrl),
          ),
          Text(
            follower.login,
            style: const TextStyle(fontSize: 17),
          ),
          Text(
            follower.id.toString(),
            style: themeData.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
