import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums/enums.dart';
import 'task_type_subtable_controller.dart';

class TaskTypeSubtable extends ConsumerWidget {
  const TaskTypeSubtable(this.statusChoice, {super.key});
  final TaskStatusChoices statusChoice;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks =
        ref.watch(taskTypeSubtableControllerProvider(statusChoice)).value;
    return Column(
      children: [
        Text(statusChoice.name),
        ...tasks?.map((e) => ListTile(
                  title: Text(e.name),
                )) ??
            const [],
      ],
    );
  }
}
