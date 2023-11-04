import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/tasks/task.dart';
import '../../../models/users/user.dart';
import '../../../repositories/tasks_repository.dart';
import '../../../services/projects_service.dart';

part 'task_detail_view_controller.g.dart';

@riverpod
class TaskDetailViewController extends _$TaskDetailViewController {
  @override
  FutureOr<(Task?, User?, User?)> build(int taskId) async {
    final currProject = ref.watch(currentProjectSubServiceProvider).value;
    if (currProject != null) {
      final tasks =
          await ref.watch(tasksRepositoryProvider).getTasks(currProject);
      final task = tasks?.firstWhereOrNull((element) => element.id == taskId);
      final users =
          ref.watch(currentProjectSubServiceProvider).value?.allUsers ??
              <User>[];
      final user =
          users.firstWhereOrNull((element) => element.id == task?.assignedTo);
      final creator =
          users.firstWhereOrNull((element) => element.id == task?.createdBy);
      return (task, user, creator);
    }
    return (null, null, null);
  }
}
