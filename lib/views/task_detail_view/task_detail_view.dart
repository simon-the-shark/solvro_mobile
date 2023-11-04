import 'package:flutter/material.dart';

import '../../models/tasks/task.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const ModalBarrier(
        color: Colors.black54,
      ),
      Column(
        children: [
          Card(
              margin: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1],
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.primary,
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Your super new task",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .labelLarge!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ],
              ))
        ],
      )
    ]);
  }
}
