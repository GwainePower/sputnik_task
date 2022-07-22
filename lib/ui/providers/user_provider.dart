import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboading_task/data/api/github_users_repo.dart';

import '../../domain/models/github_user.dart';

final _usersRepoProvider =
    Provider<GithubUsersRepo>((ref) => GithubUsersRepo());

class UserSearch extends StateNotifier<String> {
  UserSearch() : super('');

  void applyQuery(String query) {
    state = query;
  }
}

final userSearchProvider =
    StateNotifierProvider<UserSearch, String>((ref) => UserSearch());

final searchProvider = FutureProvider<GithubUser>((ref) async {
  final searchQuery = ref.watch(userSearchProvider);
  final repo = ref.watch(_usersRepoProvider);
  return await repo.fetchUser(searchQuery);
});
