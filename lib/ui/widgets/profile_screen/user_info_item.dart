import 'package:flutter/material.dart';

import 'package:onboading_task/domain/models/github_user.dart';

class UserInfoItem extends StatelessWidget {
  final GithubUser user;
  const UserInfoItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: deviceSize.height * 0.1,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: themeData.textTheme.headline3,
        ),
        const SizedBox(height: 5),
        Text(
          user.id.toString(),
          style: themeData.textTheme.subtitle1,
        ),
      ],
    );
  }
}
