import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/enums/enums.dart';

part 'new_task_view_controller.g.dart';

@riverpod
class NewTaskViewController extends _$NewTaskViewController {
  final NewTaskViewFormController _formController = NewTaskViewFormController();

  @override
  FutureOr<void> build() {}

  Future<void> saveTask() async {
    if (await validateForm()) {
      // state = const AsyncLoading();
      // state = await AsyncValue.guard(() async {
      //   await ref.read(authServiceProvider.notifier).login(
      //         _loginViewFormController.email!,
      //         _loginViewFormController.password!,
      //       );
      //   return ref.read(authServiceProvider).value;
      // });
    }
  }

  Future<bool> validateForm() async {
    state = await AsyncValue.guard(() async {
      _formController.validate();
      // return ref.read(authServiceProvider).value;
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

  void nameOnChanged(String val) => _formController.name = val;
  void estimationOnChanged(EstimationChoices? val) =>
      _formController.estimation = val;
  void onAssignedToChanged(int? val) => _formController.assignedTo = val;
}

class NewTaskViewFormController {
  String? name;
  EstimationChoices? estimation;
  int? assignedTo;

  void validate() {
    _nameValidator();
    _estimationValidator();
  }

  void _nameValidator() {
    final value = name;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"email": "Task name is mandatory"}));
    }
  }

  void _estimationValidator() {
    final value = name;
    if (value == "" || value == null) {
      throw Exception(
          jsonEncode({"estimation": "Estimation number is mandatory"}));
    }
  }
}
