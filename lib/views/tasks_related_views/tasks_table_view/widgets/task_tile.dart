import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/tasks/task.dart';
import '../../../../services/projects_service.dart';
import '../../task_detail_view/task_detail_view.dart';
import '../../widgets/estimation_medal.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile(this.task, {super.key});
  final Task task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(currentProjectSubServiceProvider).value?.allUsers;
    final subtitle = (users)
        ?.firstWhereOrNull(
          (e) => e.id == task.assignedTo,
        )
        ?.representationName;

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return TaskDetailView(
              taskId: task.id!,
            );
          },
          barrierColor: Colors.black.withOpacity(0.9),
        );
      },
      title: Text(task.name),
      subtitle: subtitle == null ? null : Text(subtitle),
      leading: task.showExclamation
          ? Icon(
              Icons.warning_amber_outlined,
              color: Colors.yellow.shade800,
            )
          : null,
      trailing: EstimationMedal(estimation: task.estimation),
    );
  }
}
