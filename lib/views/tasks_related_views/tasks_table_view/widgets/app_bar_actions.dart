import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../repositories/tasks_repository.dart';

class AppBarActions extends DelegatingList<Widget> {
  AppBarActions(BuildContext context)
      : super(
          [
            IconButton(
              onPressed: () {
                context.push("/newTask");
              },
              icon: const Icon(
                Icons.add_box,
                color: Colors.white,
              ),
            ),
            const RefreshIcon()
          ],
        );
}

class RefreshIcon extends ConsumerWidget {
  const RefreshIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.invalidate(tasksRepositoryProvider);
      },
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }
}
