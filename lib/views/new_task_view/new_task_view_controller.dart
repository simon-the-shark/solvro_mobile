import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../go_router.dart';
import '../../models/enums/enums.dart';
import '../../models/tasks/task.dart';
import '../../models/users/user.dart';
import '../../repositories/tasks_repository.dart';
import '../../services/auth_service.dart';
import '../../services/projects_service.dart';

part 'new_task_view_controller.g.dart';

@riverpod
class NewTaskViewController extends _$NewTaskViewController {
  final NewTaskViewFormController _formController = NewTaskViewFormController();

  @override
  FutureOr<void> build() {}

  Future<void> saveTask() async {
    if (await validateForm()) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => ref
            .read(tasksRepositoryProvider)
            .addTask(
              Task(
                id: null,
                project: ref.read(currentProjectSubServiceProvider).value!.id,
                createdBy: ref.read(authServiceProvider).value!.id,
                assignedTo: _formController.assignedTo?.id,
                createdAt: DateTime.now(),
                name: _formController.name!,
                estimation: _formController.estimation!,
                status: _formController.assignedTo?.id == null
                    ? TaskStatusChoices.notAssigned
                    : TaskStatusChoices.inProgress,
              ),
            )
            .then((value) => ref.refresh(tasksRepositoryProvider))
            .then(
              (value) => ref.read(goRouterProvider).go("/"),
            ),
      );
    }
  }

  Future<bool> validateForm() async {
    state = await AsyncValue.guard(() async {
      _formController.validate();
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
  void onAssignedToChanged(User? val) => _formController.assignedTo = val;
}

class NewTaskViewFormController {
  String? name;
  EstimationChoices? estimation;
  User? assignedTo;

  void validate() {
    _nameValidator();
    _estimationValidator();
  }

  void _nameValidator() {
    final value = name;
    if (value == "" || value == null) {
      throw Exception(jsonEncode({"email": "Task name can't be empty"}));
    }
  }

  void _estimationValidator() {
    final value = name;
    if (value == "" || value == null) {
      throw Exception(
          jsonEncode({"estimation": "Estimation number can't be empty"}));
    }
  }
}
