import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/enums/enums.dart';
import '../../../models/users/user.dart';
import '../../../services/auth_service.dart';

part 'signup_view_controller.g.dart';

@riverpod
class SignupViewController extends _$SignupViewController {
  final SignupViewFormController _signupViewFormController =
      SignupViewFormController();

  @override
  FutureOr<User?> build() {
    return ref.watch(authServiceProvider).value;
  }

  Future<void> register() async {
    if (await validateForm()) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        await ref.read(authServiceProvider.notifier).register(
              _signupViewFormController.email!,
              _signupViewFormController.password!,
              _signupViewFormController.profession!,
            );
        return ref.read(authServiceProvider).value;
      });
    }
  }

  Future<bool> validateForm() async {
    state = await AsyncValue.guard(() async {
      _signupViewFormController.validate();
      return ref.read(authServiceProvider).value;
    });
    return !state.hasError;
  }

  Map<String, dynamic> formatExceptionMap() {
    if (state.error == null) return {};
    final errorList = state.error.toString().split("Exception: ");
    if (errorList.length >= 2) {
      return (jsonDecode(errorList[1]) as Map<String, dynamic>).map(
          (key, value) => (value is List)
              ? MapEntry(key, value[0] ?? "Err")
              : MapEntry(key, value));
    }
    return {"error": state.error.toString()};
  }

  void passwordOnChanged(String val) =>
      _signupViewFormController.password = val;
  void emailOnChanged(String val) => _signupViewFormController.email = val;
  void professionOnChanged(ProfessionChoices? val) =>
      _signupViewFormController.profession = val;
}

class SignupViewFormController {
  String? email;
  String? password;
  ProfessionChoices? profession;

  void validate() {
    _emailValidator();
    _passwordValidator();
    _professionValidator();
  }

  void _emailValidator() {
    final value = email;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"email": "Email can't be empty"}));
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      throw Exception(jsonEncode({"email": "Invalid email format"}));
    }
  }

  void _passwordValidator() {
    final value = password;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"password": "Password can't be empty"}));
    }
    if (value.length < 6) {
      throw Exception(
          jsonEncode({"password": "Password needs at least 6 characters"}));
    }
  }

  void _professionValidator() {
    if (profession == null || profession == ProfessionChoices.none) {
      throw Exception(jsonEncode({"profession": "Profession can't be empty"}));
    }
  }
}
