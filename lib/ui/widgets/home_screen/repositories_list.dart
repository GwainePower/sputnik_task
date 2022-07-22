import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/repositories_provider.dart';

import 'category_title.dart';
import 'repository_item.dart';

import '../loading_widget.dart';

class RepositoriesList extends ConsumerWidget {
  const RepositoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = AppLocalizations.of(context)!;
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    final repositories = ref.watch(repositoriesProvider(userName));
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CategoryTitle(titleText: langs.repositories),
        repositories.when(
          data: (reposList) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: deviceSize.height * 0.26,
            child: ListView.builder(
              itemCount: reposList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => RepositoryItem(repository: reposList[i]),
            ),
          ),
          error: (error, stackTrace) => Container(),
          loading: () => const LoadingWidget(),
        ),
      ],
    );
  }
}
