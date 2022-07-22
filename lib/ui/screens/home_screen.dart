import 'package:flutter/material.dart';
import 'package:onboading_task/ui/widgets/home_screen/followers_list.dart';
import 'package:onboading_task/ui/widgets/home_screen/repositories_list.dart';

import '../widgets/home_screen/user_main_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UserMainInfo(),
            FollowersList(),
            RepositoriesList(),
          ],
        ),
      ),
    );
  }
}
