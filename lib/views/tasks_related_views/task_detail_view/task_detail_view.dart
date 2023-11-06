import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/max_width_box.dart';

import '../../../models/enums/enums.dart';
import '../../../widgets/primary_button.dart';
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
      child: MaxWidthBox(
        maxWidth: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            TaskDetailCard(
              task: task,
              user: user,
              creator: creator,
              actions: [
                const SizedBox(height: 20),
                PrimaryButton(
                  size: const Size(200, 45),
                  text: "Edit task",
                  onPressed: () async {
                    final response = await context.push("/tasks/edit/$taskId");
                    if (response == true) Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 8),
                if (task?.status != TaskStatusChoices.closed)
                  SecondaryButton(
                      onPressed: () {
                        ref
                            .read(taskDetailViewControllerProvider(taskId)
                                .notifier)
                            .closeTask();
                      },
                      text: "Close task"),
                const SizedBox(height: 8),
                if (task?.status != TaskStatusChoices.closed)
                  DeleteButton(
                    onLoaded: () {
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
                    },
                  ),
                if (task?.status == TaskStatusChoices.closed)
                  const BlockedDeleteButton(),
                const SizedBox(height: 15),
              ],
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
