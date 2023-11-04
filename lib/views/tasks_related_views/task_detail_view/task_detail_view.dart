import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/secondary_button.dart';
import 'task_detail_view_controller.dart';
import 'widgets/delete_button.dart';
import 'widgets/delete_dialog.dart';
import 'widgets/task_detail_card.dart';

class TaskDetailView extends ConsumerWidget {
  const TaskDetailView({super.key, required this.taskId});
  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(taskDetailViewControllerProvider(taskId));
    final task = status.value?.$1;
    final user = status.value?.$2;
    final creator = status.value?.$3;
    if (status.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          TaskDetailCard(task: task, user: user, creator: creator),
          const Spacer(),
          SecondaryButton(
            color: Theme.of(context).colorScheme.tertiary,
            text: "Edit task",
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          DeleteButton(onLoaded: () {
            Navigator.of(context).pop();
            showDialog(
              barrierColor: Colors.black.withOpacity(0.9),
              context: context,
              builder: (context) {
                return Theme(
                  data: Theme.of(context),
                  child: DeleteDialog(
                    task: task!,
                  ),
                );
              },
            );
          }),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
