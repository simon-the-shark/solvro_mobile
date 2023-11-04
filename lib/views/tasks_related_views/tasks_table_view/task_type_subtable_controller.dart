import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../repositories/tasks_repository.dart';
import '../../../services/projects_service.dart';

part 'task_type_subtable_controller.g.dart';

@riverpod
class TaskTypeSubtableController extends _$TaskTypeSubtableController {
  @override
  FutureOr<List<Task>?> build(TaskStatusChoices statusChoice) async {
    final currProject = ref.watch(currentProjectSubServiceProvider).value;
    if (currProject != null) {
      final tasks =
          await ref.watch(tasksRepositoryProvider).getTasks(currProject);
      return tasks?.where((element) => element.status == statusChoice).toList();
    }
    return null;
  }

  void setShowFilterState(bool show) {
    if (!show) {
      state = const AsyncData(null);
    } else {
      ref.invalidateSelf();
    }
  }
}
