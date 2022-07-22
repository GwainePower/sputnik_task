import 'package:dio/dio.dart';

import '../../domain/models/github_repo.dart';

import './api_client.dart';

class GithubRepositoryRepo {
  final Dio _apiClient = ApiClient.init();

  Future<List<GithubRepo>> fetchUserRepos(String user) async {
    final response = await _apiClient.get('/$user/repos');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((repo) => GithubRepo.fromMap(repo))
          .toList();
    } else {
      throw Exception('Could not fetch repositories list!');
    }
  }
}
