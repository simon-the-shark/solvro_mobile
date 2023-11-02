import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/enums/enums.dart';
import '../models/users/user.dart';

final userLocalRepositoryProvider = Provider<UserLocalRepository>((ref) {
  return UserLocalRepository();
});

class UserLocalRepository {
  static const _tokenStringKey = "user_auth_token";
  static const _emailStringKey = "user_email";
  static const _professionStringKey = "user_profession";
  static const _nameStringKey = "name";
  static const _idStringKey = "user_id";

  late final _prefs = SharedPreferences.getInstance();

  Future<void> saveUser(User user) async {
    final prefs = await _prefs;
    await prefs.setString(_tokenStringKey, user.token);
    await prefs.setString(_emailStringKey, user.email);
    await prefs.setString(_nameStringKey, user.name);
    await prefs.setInt(_idStringKey, user.id);
    final profesion = EnumJsonConverter.valueString(user.profession);
    if (profesion != null) {
      await prefs.setString(_professionStringKey, profesion);
    }
  }

  Future<User?> retrieveUser() async {
    final prefs = await _prefs;
    if (prefs.getString(_tokenStringKey) == null) return null;
    return User.fromJson({
      "token": prefs.getString(_tokenStringKey),
      "email": prefs.getString(_emailStringKey) ?? "",
      "id": prefs.getInt(_idStringKey) ?? "",
      "name": prefs.getString(_nameStringKey) ?? "",
      "profession": prefs.getString(_professionStringKey) ?? "BACKEND",
    });
  }

  Future<void> deleteUser() async {
    final prefs = await _prefs;
    await prefs.remove(_tokenStringKey);
    await prefs.remove(_emailStringKey);
    await prefs.remove(_professionStringKey);
    await prefs.remove(_nameStringKey);
    await prefs.remove(_idStringKey);
  }
}
