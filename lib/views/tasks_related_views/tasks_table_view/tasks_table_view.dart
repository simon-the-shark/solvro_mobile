import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../models/enums/enums.dart';
import '../../../repositories/tasks_repository.dart';
import 'task_type_subtable.dart';
import 'widgets/empty_table.dart';
import 'widgets/filter_desktop_section.dart';

class TasksTableView extends ConsumerWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ResponsiveBreakpoints.of(context).largerThan('HIDE_DRAWER')) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.vertical,
          ),
          const TaskTable(),
        ],
      );
    }
    return RefreshIndicator(
        onRefresh: () async => ref.refresh(tasksRepositoryProvider),
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: TaskTable(),
        ));
  }
}

class TaskTable extends StatelessWidget {
  const TaskTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP))
            const FilterDesktopSection(),
          if (ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP))
            const Divider(),
          Stack(
            children: [
              Padding(
                padding:
                    ResponsiveBreakpoints.of(context).largerThan('HIDE_DRAWER')
                        ? const EdgeInsets.only(
                            top: 15, bottom: 100, left: 20, right: 20)
                        : const EdgeInsets.only(top: 15, bottom: 100),
                child: ResponsiveBreakpoints.of(context)
                        .largerOrEqualTo(DESKTOP)
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width -
                            ((ResponsiveBreakpoints.of(context)
                                    .largerThan('HIDE_DRAWER'))
                                ? 340
                                : 0),
                        child: const Column(
                          children: [
                            EmptyTable(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TaskTypeSubtable(TaskStatusChoices.notAssigned,
                                    wrapWithExpanded: true),
                                TaskTypeSubtable(TaskStatusChoices.inProgress,
                                    wrapWithExpanded: true),
                                TaskTypeSubtable(TaskStatusChoices.closed,
                                    wrapWithExpanded: true),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const Column(
                        children: [
                          TaskTypeSubtable(TaskStatusChoices.notAssigned),
                          TaskTypeSubtable(TaskStatusChoices.inProgress),
                          TaskTypeSubtable(TaskStatusChoices.closed),
                          EmptyTable(),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
