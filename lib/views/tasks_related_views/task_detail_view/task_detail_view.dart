import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/enums/enums.dart';
import '../../../widgets/secondary_button.dart';
import 'task_detail_view_controller.dart';
import 'widgets/blocked_delete_button.dart';
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
            onPressed: () {
              context.push("/tasks/edit/$taskId");
            },
          ),
          const SizedBox(height: 15),
          if (task?.status != TaskStatusChoices.closed)
            DeleteButton(onLoaded: () {
              Navigator.of(context).pop();
              showDialog(
                barrierColor: Colors.black.withOpacity(0.9),
                context: context,
                builder: (context) {
                  final container = ProviderScope.containerOf(context);
                  return ProviderScope(
                    parent: container,
                    child: Theme(
                      data: Theme.of(context),
                      child: DeleteDialog(
                        task: task!,
                      ),
                    ),
                  );
                },
              );
            }),
          if (task?.status == TaskStatusChoices.closed)
            const BlockedDeleteButton(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
