import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import 'task_type_subtable.dart';
import 'widgets/empty_table.dart';
import 'widgets/status_filter_chip.dart';

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
                // Divider(),
                // Text("Filter table"),
                // Divider(),
                ExpansionTile(
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    title: Text("Filter table options"),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            StatusFilterChip(TaskStatusChoices.notAssigned),
                            StatusFilterChip(TaskStatusChoices.inProgress),
                            StatusFilterChip(TaskStatusChoices.closed),
                          ],
                        ),
                      ),
                    ]),
                // ListTile(),
                // SizedBox(height: 30),
                TaskTypeSubtable(TaskStatusChoices.notAssigned),
                TaskTypeSubtable(TaskStatusChoices.inProgress),
                TaskTypeSubtable(TaskStatusChoices.closed),
                EmptyTable(),
                SizedBox(height: 100),
              ],
            ),
          ),
          //Expansion tile here?
        ],
      ),
    );
  }
}
