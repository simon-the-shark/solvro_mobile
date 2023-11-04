import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../go_router.dart';
import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../models/users/user.dart';
import '../../../repositories/tasks_repository.dart';
import '../../../services/projects_service.dart';

part 'task_edit_view_controller.g.dart';

@riverpod
class TaskEditViewController extends _$TaskEditViewController {
  // late TaskEditViewFormController _formController;

  @override
  FutureOr<(List<User>, Task)> build(int taskId) async {
    final tasks = await ref
        .watch(tasksRepositoryProvider)
        .getTasks(ref.watch(currentProjectSubServiceProvider).value!);
    final task = tasks!.firstWhereOrNull((element) => element.id == taskId);
    final users =
        ref.watch(currentProjectSubServiceProvider).value?.allUsers ?? <User>[];
    // _formController = TaskEditViewFormController(task!, users);
    return (users, task!);
  }

  Future<void> editTask() async {
    // if (await validateForm()) {
    final updatedTask = state.value!.$2;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(tasksRepositoryProvider)
          .updateTask(updatedTask)
          .then(
            (value) => ref.read(goRouterProvider).go("/"),
          )
          .then((value) => state.value!),
    );
    // }
  }

  // Future<bool> validateForm() async {
  //   state = await AsyncValue.guard(() async {
  //     _formController.validate();
  //     return state.value!;
  //   });
  //   return !state.hasError;
  // }

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

  void nameOnChanged(String val) {
    state = AsyncData((state.value!.$1, state.value!.$2.copyWithName(val)));
  }

  void estimationOnChanged(EstimationChoices? val) {
    state =
        AsyncData((state.value!.$1, state.value!.$2.copyWithEstimation(val!)));
  }

  void onAssignedToChanged(User? val) {
    state = AsyncData((state.value!.$1, state.value!.$2.assignTo(val?.id)));
  }

  void onStatusChanged(TaskStatusChoices? val) {
    state = AsyncData((state.value!.$1, state.value!.$2.copyWithStatus(val!)));
  }
}

// class TaskEditViewFormController {
//   String? name;
//   EstimationChoices? estimation;
//   User? assignedTo;
//   TaskStatusChoices? status;

//   TaskEditViewFormController(Task task, List<User> users)
//       : name = task.name,
//         estimation = task.estimation,
//         status = task.status,
//         assignedTo =
//             users.firstWhereOrNull((element) => task.assignedTo == element.id);

//   void validate() {
//     _nameValidator();
//     _estimationValidator();
//     _statusValidator();
//   }

//   void _nameValidator() {
//     final value = name;
//     if (value == "" || value == null) {
//       throw Exception(jsonEncode({"email": "Task name can't be empty"}));
//     }
//   }

//   void _estimationValidator() {
//     final value = estimation;
//     if (value == null) {
//       throw Exception(
//           jsonEncode({"estimation": "Estimation number can't be empty"}));
//     }
//   }

//   void _statusValidator() {
//     if (status == null) {
//       throw Exception(jsonEncode({"status": "Status can't be empty"}));
//     }
//   }
// }
