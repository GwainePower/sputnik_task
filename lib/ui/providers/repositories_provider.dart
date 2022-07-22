import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboading_task/data/api/github_repository_repo.dart';
import 'package:onboading_task/domain/models/github_repo.dart';

final _repositoriesRepo =
    Provider<GithubRepositoryRepo>((ref) => GithubRepositoryRepo());

final repositoriesProvider =
    FutureProvider.family<List<GithubRepo>, String>((ref, userName) async {
  final repo = ref.watch(_repositoriesRepo);
  return await repo.fetchUserRepos(userName);
});
