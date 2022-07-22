import 'package:flutter/material.dart';
import 'package:sputnik_task/constants/colors.dart';

import '../../../domain/models/github_repo.dart';
import 'icon_info.dart';

class RepositoryItem extends StatelessWidget {
  final GithubRepo repository;
  const RepositoryItem({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.repoItemColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  repository.language,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 20,
                width: 100,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    repository.name,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Text(
                repository.id.toString(),
                style: themeData.textTheme.caption,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconInfo(
                icon: Icons.star_rounded,
                count: repository.stars,
                foregroundColor: AppColors.starColor,
                backgroundColor: AppColors.searchBackground,
              ),
              IconInfo(
                icon: Icons.fork_left_rounded,
                count: repository.forks,
                foregroundColor: AppColors.screenBackground,
                backgroundColor: AppColors.primaryText,
              )
            ],
          )
        ],
      ),
    );
  }
}
