import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../services/projects_service.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(task.name),
          subtitle: subtitle == null ? null : Text(subtitle),
          leading: showExclamation
              ? Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.yellow.shade900,
                )
              : null,
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                EnumJsonConverter.valueString(task.estimation) ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
