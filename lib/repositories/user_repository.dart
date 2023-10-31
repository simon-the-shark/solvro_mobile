import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dependency_injection/dio.dart';
import '../models/enums.dart';
import '../models/user.dart';

part 'user_repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  static const _tokenStringKey = "user_auth_token";
  static const _emailStringKey = "user_email";
  static const _professionStringKey = "user_profession";
  static const _nameStringKey = "name";
  static const _idStringKey = "user_id";

  static const _apiUrl = "http://localhost:8000/api/auth/";
  late final Dio _dio = ref.read(dioProvider);
  late final SharedPreferences _prefs;

  @override
  Future<User?> build() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString(_tokenStringKey) == null) return null;
    return User.fromJson({
      "email": _prefs.getString(_emailStringKey) ?? "",
      "id": _prefs.getInt(_idStringKey) ?? "",
      "name": _prefs.getString(_nameStringKey) ?? "",
      "profession": _prefs.getString(_professionStringKey) ?? "BACKEND",
    });
  }

  Future<User?> login(String email, String password) async {
    try {
      final response = await _dio.post("${_apiUrl}login/", data: {
        "email": email,
        "password": password,
      });
      print(response.data);
      return _saveUser(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.response);
      return null;
    }
  }

  Future<User?> register(
      String email, String password, ProfessionChoices profession,
      [String? name]) async {
    try {
      final response = await _dio.post("${_apiUrl}register/", data: {
        "email": email,
        "password": password,
        "profession":
            EnumJsonConverter(profession: profession).toJson()["profession"],
        if (name != null) "name": name,
      });
      print(response.data);
      return _saveUser(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.response);
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post("${_apiUrl}logout/");
    } on DioException catch (e) {
      print(e.message);
      print(e.response);
    }
    await _prefs.remove(_tokenStringKey);
    await _prefs.remove(_emailStringKey);
    await _prefs.remove(_professionStringKey);
    await _prefs.remove(_nameStringKey);
    await _prefs.remove(_idStringKey);
  }

  Future<User> _saveUser(Map<String, dynamic> data) async {
    await _prefs.setString(_tokenStringKey, data["token"]);
    await _prefs.setString(_emailStringKey, data["email"]);
    await _prefs.setString(_nameStringKey, data["name"]);
    await _prefs.setInt(_idStringKey, data["id"]);
    if (data["profession"] != null && data["profession"] != "") {
      await _prefs.setString(_professionStringKey, data["profession"]);
    }
    return User.fromJson(data);
  }
}
