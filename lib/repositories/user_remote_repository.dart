import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums.dart';
import '../models/user.dart';

final userRemoteRepositoryProvider = Provider<UserRemoteRepository>((ref) {
  return UserRemoteRepository(Dio());
});

class UserRemoteRepository {
  UserRemoteRepository(this._dio);
  static const _apiUrl = "http://localhost:8000/api/auth/";
  late final Dio _dio;

  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post("${_apiUrl}login/", data: {
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
      final response = await _dio.post("${_apiUrl}register/", data: {
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
      await _dio.post("${_apiUrl}logout/");
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
