import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums/enums.dart';
import '../models/users/user.dart';
import 'api_details.dart';

final authRemoteRepositoryProvider = Provider<AuthRemoteRepository>((ref) {
  return AuthRemoteRepository(ApiDetails(ref), Dio());
});

class AuthRemoteRepository {
  AuthRemoteRepository(this._apiDetails, this._dio);

  late final Dio _dio;
  final ApiDetails _apiDetails;

  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post(_apiDetails.loginUrl, data: {
        "email": email,
        "password": password,
      });
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<User> register(
    String email,
    String password,
    ProfessionChoices profession, [
    String? name,
  ]) async {
    try {
      final response = await _dio.post(_apiDetails.registerUrl, data: {
        "email": email,
        "password": password,
        "profession": EnumJsonConverter.valueString(profession),
        if (name != null) "name": name,
      });
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(_apiDetails.logoutUrl, options: _apiDetails.authHeaders);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
