import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/tasks/task.dart';
import '../../../../repositories/tasks_repository.dart';
import '../../../../widgets/secondary_button.dart';

class DeleteDialog extends ConsumerWidget {
  const DeleteDialog({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text("Confirm deletion"),
      // titleTextStyle:
      content: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          text:
              "It's your last chance to turn back!\n\nAre you sure you want to ",
          children: [
            TextSpan(
              text: 'delete "${task.name}" task?\n\n',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsOverflowButtonSpacing: 12,
      actionsOverflowDirection: VerticalDirection.up,
      actions: [
        SecondaryButton(
          onPressed: Navigator.of(context).pop,
          text: "Cancel",
          // size: const Size(120, 40),
        ),
        SizedBox.fromSize(
          size: const Size(200, 45),
          child: FilledButton(
            onPressed: () {
              ref.read(tasksRepositoryProvider).deleteTask(task);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.error,
              ),
            ),
            child: Text(
              "Delete task",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
