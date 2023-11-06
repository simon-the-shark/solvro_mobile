import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import '../../projects_related_views/projects_drawer/projects_drawer.dart';
import 'task_type_subtable.dart';
import 'widgets/empty_table.dart';

class TasksTableView extends StatelessWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).largerThan('HIDE_DRAWER')) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.vertical,
            child: const ProjectsDrawer(),
          ),
          const TaskTable(),
        ],
      );
    }
    return const TaskTable();
  }
}

class TaskTable extends ConsumerWidget {
  const TaskTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const subtables = [
      TaskTypeSubtable(TaskStatusChoices.notAssigned),
      TaskTypeSubtable(TaskStatusChoices.inProgress),
      TaskTypeSubtable(TaskStatusChoices.closed),
    ];
    const empty = EmptyTable();
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => ref.refresh(tasksRepositoryProvider),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  ResponsiveBreakpoints.of(context).largerThan('HIDE_DRAWER')
                      ? const EdgeInsets.only(
                          top: 15, bottom: 100, left: 20, right: 20)
                      : const EdgeInsets.only(top: 15, bottom: 100),
              child: ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP)
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width -
                          ((ResponsiveBreakpoints.of(context)
                                  .largerThan('HIDE_DRAWER'))
                              ? 340
                              : 0),
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
        ),
      ],
    );
  }
}
