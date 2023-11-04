import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../widgets/status_header_tile.dart';
import 'task_type_subtable_controller.dart';
import 'widgets/empty_task_status_list.dart';
import 'widgets/expansion_title.dart';
import 'widgets/task_tile.dart';

class TaskTypeSubtable extends ConsumerStatefulWidget {
  const TaskTypeSubtable(this.statusChoice, {super.key});
  final TaskStatusChoices statusChoice;

  @override
  ConsumerState<TaskTypeSubtable> createState() => _TaskTypeSubtableState();
}

class _TaskTypeSubtableState extends ConsumerState<TaskTypeSubtable> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(taskTypeSubtableControllerProvider(widget.statusChoice))
        .isLoading;
    final tasks = ref
        .watch(taskTypeSubtableControllerProvider(widget.statusChoice))
        .value;
    const shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
    if (!isLoading && tasks == null) {
      return Container();
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: StatusHeaderTile(
                statusChoice: widget.statusChoice, isExpanded: isExpanded),
          ),
          ExpansionTile(
            iconColor: Theme.of(context).colorScheme.onPrimary,
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            shape: shape,
            collapsedShape: shape,
            title: ExpansionTitle(widget.statusChoice),
            initiallyExpanded: true,
            children: isLoading
                ? [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(100.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ]
                : ([
                    const SizedBox(height: 15),
                    ...(tasks
                            ?.map((e) => TaskTile(e))
                            .expand((element) => [
                                  const Divider(),
                                  element,
                                ])
                            .toList() ??
                        const []),
                    if (tasks == null || tasks.isEmpty) Container(),
                    if (tasks == null || tasks.isEmpty)
                      const EmptyTaskStatusList(),
                    const SizedBox(height: 15),
                  ]..removeAt(1)),
          ),
        ],
      ),
    );
  }
}
