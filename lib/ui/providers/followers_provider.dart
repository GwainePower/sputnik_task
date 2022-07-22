import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboading_task/data/api/github_users_repo.dart';

import '../../domain/models/github_user.dart';

final _usersRepoProvider =
    Provider<GithubUsersRepo>((ref) => GithubUsersRepo());

final followersProvider =
    FutureProvider.family<List<GithubUser>, String>((ref, userName) async {
  final repo = ref.watch(_usersRepoProvider);
  return await repo.fetchUserFollowers(userName, 'followers');
});
