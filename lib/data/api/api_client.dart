import 'package:dio/dio.dart';

class ApiClient {
  static Dio init() {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://api.github.com/users',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      method: 'GET',
      responseType: ResponseType.json,
    );
    return Dio(options);
  }
}
