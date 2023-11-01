import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';

part 'login_view_controller.g.dart';

@riverpod
class LoginViewController extends _$LoginViewController {
  final LoginViewFormController _loginViewFormController =
      LoginViewFormController();

  @override
  FutureOr<User?> build() {
    return ref.watch(authServiceProvider).value;
  }

  Future<void> login() async {
    if (await validateForm()) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        await ref.read(authServiceProvider.notifier).login(
              _loginViewFormController.email!,
              _loginViewFormController.password!,
            );
        return ref.read(authServiceProvider).value;
      });
    }
  }

  Future<bool> validateForm() async {
    state = await AsyncValue.guard(() async {
      _loginViewFormController.validate();
      return ref.read(authServiceProvider).value;
    });
    return !state.hasError;
  }

  Map<String, dynamic> formatExceptionMap() {
    if (state.error == null) return {};
    final errorList = state.error.toString().split("Exception: ");
    if (errorList.length >= 2) return jsonDecode(errorList[1]);
    return {"error": state.error.toString()};
  }

  void passwordOnChanged(String val) => _loginViewFormController.password = val;
  void emailOnChanged(String val) => _loginViewFormController.email = val;
}

class LoginViewFormController {
  String? email;
  String? password;

  void validate() {
    _emailValidator();
    _passwordValidator();
  }

  void _emailValidator() {
    final value = email;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"email": "Email is mandatory"}));
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      throw Exception(jsonEncode({"email": "Invalid email format"}));
    }
  }

  void _passwordValidator() {
    final value = password;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"password": "Password is mandatory"}));
    }
  }
}
