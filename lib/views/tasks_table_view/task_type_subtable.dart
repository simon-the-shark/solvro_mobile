import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums/enums.dart';
import 'task_type_subtable_controller.dart';
import 'widgets/empty_task_status_list.dart';
import 'widgets/expansion_title.dart';
import 'widgets/task_tile.dart';

extension ColorsStatuses on TaskStatusChoices {
  List<Color>? get gradientColors {
    switch (this) {
      case TaskStatusChoices.notAssigned:
        return [
          Colors.yellow.shade800,
          Colors.yellow.shade500,
        ];
      case TaskStatusChoices.inProgress:
        return [
          Colors.blue.shade700,
          Colors.blue.shade300,
        ];
      case TaskStatusChoices.closed:
        return [
          Colors.grey.shade700,
          Colors.grey.shade500,
        ];
    }
  }
}

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
    final tasks = ref
        .watch(taskTypeSubtableControllerProvider(widget.statusChoice))
        .value;
    const shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 75,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.5, 1],
                  colors: widget.statusChoice.gradientColors ??
                      [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.inverseSurface,
                      ],
                ),
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )
                    : BorderRadius.circular(12),
              ),
              duration: const Duration(milliseconds: 300),
            ),
          ),
          ExpansionTile(
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            shape: shape,
            collapsedShape: shape,
            title: ExpansionTitle(widget.statusChoice),
            initiallyExpanded: true,
            children: [
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
              if (tasks == null || tasks.isEmpty) const EmptyTaskStatusList(),
              const SizedBox(height: 15),
            ]..removeAt(1),
          ),
        ],
      ),
    );
  }
}
