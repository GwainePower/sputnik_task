import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../loading_widget.dart';
import '../primary_button.dart';

import '../../providers/user_provider.dart';

class UserMainInfo extends ConsumerWidget {
  const UserMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = AppLocalizations.of(context)!;
    // final user = ref.watch(userNotifierProvider);
    final user = ref.watch(searchProvider);
    final themeData = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return user.when(
      data: (user) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: deviceSize.width * 0.55,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      user.login,
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                ),
                PrimaryButton(
                  width: 10,
                  height: 10,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.add_rounded),
                      Text(
                        langs.followOnGithub,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          user.company != ''
              ? Text(
                  '${langs.company} - ${user.company}',
                  style: themeData.textTheme.subtitle1,
                )
              : const SizedBox(),
          user.email != ''
              ? Text(
                  '${langs.email} - ${user.email}',
                  style: themeData.textTheme.subtitle1,
                )
              : const SizedBox(),
          user.bio != ''
              ? Text(
                  '${langs.bio} - ${user.bio}',
                  style: themeData.textTheme.subtitle1,
                )
              : const SizedBox(),
          const Divider(thickness: 1)
        ],
      ),
      error: (error, stackTrace) {
        return Container();
      },
      loading: () => const LoadingWidget(),
    );
  }
}
