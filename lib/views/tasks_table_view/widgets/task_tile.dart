import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../services/projects_service.dart';
import 'estimation_medal.dart';

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
        ?.name;
    final showExclamation = task.status == TaskStatusChoices.notAssigned &&
        task.createdAt.difference(DateTime.now()).inDays <= -14;
    return ListTile(
      onTap: () {
        context.push("/tasks/${task.id}");
      },
      title: Text(task.name),
      subtitle: subtitle == null ? null : Text(subtitle),
      leading: showExclamation
          ? Icon(
              Icons.warning_amber_outlined,
              color: Colors.yellow.shade800,
            )
          : null,
      trailing: EstimationMedal(task: task),
    );
  }
}
