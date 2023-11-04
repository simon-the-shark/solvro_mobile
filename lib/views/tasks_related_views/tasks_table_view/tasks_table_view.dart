import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import 'task_type_subtable.dart';

class TasksTableView extends ConsumerWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(tasksRepositoryProvider),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            TaskTypeSubtable(TaskStatusChoices.notAssigned),
            TaskTypeSubtable(TaskStatusChoices.inProgress),
            TaskTypeSubtable(TaskStatusChoices.closed),
          ],
        ),
      ),
    );
  }
}
