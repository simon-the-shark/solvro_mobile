import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewTaskFloatingActionButton extends ConsumerWidget {
  const NewTaskFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: FloatingActionButton.extended(
        onPressed: () {
          context.push("/newTask");
        },
        // backgroundColor: Colors.green.shade700,
        backgroundColor: Theme.of(context).colorScheme.primary,
        label: Text(
          "New task",
          style: Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        icon: Icon(
          Icons.add_box_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
