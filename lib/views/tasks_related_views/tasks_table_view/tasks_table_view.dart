import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import 'task_type_subtable.dart';
import 'widgets/empty_table.dart';

class TasksTableView extends ConsumerWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(tasksRepositoryProvider),
      child: const Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                TaskTypeSubtable(TaskStatusChoices.notAssigned),
                TaskTypeSubtable(TaskStatusChoices.inProgress),
                TaskTypeSubtable(TaskStatusChoices.closed),
                EmptyTable(),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
