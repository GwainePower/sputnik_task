import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:onboading_task/ui/widgets/loading_widget.dart';
import 'package:onboading_task/ui/widgets/search_screen/search_error.dart';

import '../navigation/main_navigation.dart';
import '../providers/user_provider.dart';
import '../widgets/primary_button.dart';

import '../../constants/colors.dart';

typedef Titles = Widget;

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String _query = '';

  final _searchTextFieldController = TextEditingController();

  bool _searchApplied = false;

  void _pushToHomeScreen(String user) {
    Navigator.of(context).pushNamed(RouteNames.generalScreen, arguments: user);
  }

  @override
  void dispose() {
    _searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final langs = AppLocalizations.of(context)!;
    final userSearchState = ref.watch(searchProvider);
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);

    ref.listen<AsyncValue>(searchProvider, (_, state) {
      state.whenOrNull(data: (data) => _pushToHomeScreen(_query.trim()));
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: SizedBox(
          width: deviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Titles>[
                  Text(
                    langs.searchPageTitle,
                    style: themeData.textTheme.headline3,
                  ),
                  Text(
                    langs.searchPageSubtitle,
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 30,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 24,
                    ),
                    filled: true,
                    fillColor: AppColors.searchBackground,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: langs.hintText,
                    labelText: langs.labelText,
                    hintStyle: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 36,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 14,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  style: themeData.textTheme.headline4,
                  onChanged: (value) => setState(() => _query = value),
                  controller: _searchTextFieldController,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: deviceSize.height * 0.3,
                child: userSearchState.when(
                  data: (data) => Container(),
                  error: (error, _) => _searchApplied
                      ? SearchError(text: langs.searchError)
                      : Container(),
                  loading: () => const LoadingWidget(),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                child: PrimaryButton(
                  buttonContent: Text(langs.searchText),
                  width: deviceSize.width / 2 * 0.7,
                  height: deviceSize.height / 2 * 0.05,
                  onPressed: _query.trim() == ''
                      ? null
                      : () {
                          ref
                              .read(userSearchProvider.notifier)
                              .applyQuery(_query.trim());
                          setState(() => _searchApplied = true);
                        },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  langs.eulaMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
