import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import 'task_type_subtable.dart';
import 'widgets/empty_table.dart';

class TasksTableView extends ConsumerWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const subtables = [
      TaskTypeSubtable(TaskStatusChoices.notAssigned),
      TaskTypeSubtable(TaskStatusChoices.inProgress),
      TaskTypeSubtable(TaskStatusChoices.closed),
    ];
    const empty = EmptyTable();
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(tasksRepositoryProvider),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 100),
              child: ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP)
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...subtables
                              .map(
                                (e) => Expanded(child: e),
                              )
                              .toList(),
                          empty
                        ],
                      ),
                    )
                  : const Column(
                      children: [...subtables, empty],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
