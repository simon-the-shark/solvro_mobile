import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewTaskFloatingActionButton extends ConsumerWidget {
  const NewTaskFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.push("/newTask");
      },
      label: Text(
        "Add new task",
        style: Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      icon: Icon(
        Icons.add_box_outlined,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
