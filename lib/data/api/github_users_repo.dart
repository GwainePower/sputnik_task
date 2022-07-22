import 'package:dio/dio.dart';

import '../../domain/models/github_user.dart';

import './api_client.dart';

class GithubUsersRepo {
  final Dio _apiClient = ApiClient.init();

  Future<GithubUser> fetchUser(String user) async {
    final response = await _apiClient.get('/$user');
    if (response.statusCode == 200) {
      return GithubUser.fromMap(response.data);
    } else {
      throw Exception('User with this nickname not found!');
    }
  }

  Future<List<GithubUser>> fetchUserFollowers(
      String user, String followType) async {
    final response = await _apiClient.get('/$user/$followType');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((user) => GithubUser.fromMap(user))
          .toList();
    } else {
      throw Exception('Could not fetch users list!');
    }
  }
}
