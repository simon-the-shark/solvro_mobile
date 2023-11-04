import 'package:flutter/material.dart';

import '../../../../models/tasks/task.dart';
import '../../../../widgets/secondary_button.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("DELETION CONFIRMATION"),
      // titleTextStyle:
      content: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          text:
              'It`s your last chance to turn back.\n\nAre you sure you want to ',
          children: [
            TextSpan(
              text: 'delete "${task.name} task?\n\n',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SecondaryButton(
          onPressed: Navigator.of(context).pop,
          text: "Cancel",
          size: const Size(120, 40),
        ),
        SizedBox.fromSize(
          size: const Size(120, 40),
          child: FilledButton(
            onPressed: null,
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
