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
  @override
  FutureOr<(List<User>, Task)> build(int taskId) async {
    final tasks = await ref
        .watch(tasksRepositoryProvider)
        .getTasks(ref.watch(currentProjectSubServiceProvider).value!);
    final task = tasks!.firstWhereOrNull((element) => element.id == taskId);
    final users =
        ref.watch(currentProjectSubServiceProvider).value?.allUsers ?? <User>[];
    return (users, task!);
  }

  Future<void> editTask() async {
    final updatedTask = state.value!.$2;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(tasksRepositoryProvider)
          .updateTask(updatedTask)
          .then(
            (value) => ref.read(goRouterProvider).pop(true),
          )
          .then((value) => state.value!),
    );
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

  void nameOnChanged(String val) {
    state = AsyncData((state.value!.$1, state.value!.$2.copyWithName(val)));
  }

  void estimationOnChanged(EstimationChoices? val) {
    state =
        AsyncData((state.value!.$1, state.value!.$2.copyWithEstimation(val!)));
  }

  void onAssignedToChanged(User? val) {
    if (state.value!.$2.status == TaskStatusChoices.notAssigned &&
        val != null) {
      state = AsyncData((
        state.value!.$1,
        state.value!.$2
            .assignTo(val.id)
            .copyWithStatus(TaskStatusChoices.inProgress)
      ));
    } else if (state.value!.$2.status == TaskStatusChoices.inProgress &&
        val == null) {
      state = AsyncData((
        state.value!.$1,
        state.value!.$2
            .assignTo(val?.id)
            .copyWithStatus(TaskStatusChoices.notAssigned)
      ));
    } else {
      state = AsyncData((state.value!.$1, state.value!.$2.assignTo(val?.id)));
    }
  }

  void onStatusChanged(TaskStatusChoices? val) {
    state = AsyncData((state.value!.$1, state.value!.$2.copyWithStatus(val!)));
  }
}
