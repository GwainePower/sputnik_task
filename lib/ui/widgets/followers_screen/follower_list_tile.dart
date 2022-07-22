import 'package:flutter/material.dart';

import 'package:onboading_task/domain/models/github_user.dart';

class FolowerListTile extends StatelessWidget {
  final GithubUser follower;
  const FolowerListTile({
    Key? key,
    required this.follower,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1, height: 0),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(follower.avatarUrl),
          ),
          title: Text(
            follower.login,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(follower.id.toString()),
        ),
      ],
    );
  }
}
