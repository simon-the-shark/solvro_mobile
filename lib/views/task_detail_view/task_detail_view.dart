import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_detail_view_controller.dart';
import 'widgets/task_detail_card.dart';

class TaskDetailView extends ConsumerWidget {
  const TaskDetailView({super.key, required this.taskId});
  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(taskDetailViewControllerProvider(taskId)).value;
    final task = status?.$1;
    final user = status?.$2;
    final creator = status?.$3;
    return Stack(children: [
      const ModalBarrier(
        color: Colors.black54,
      ),
      Column(
        children: [
          TaskDetailCard(task: task, user: user, creator: creator),
        ],
      )
    ]);
  }
}
