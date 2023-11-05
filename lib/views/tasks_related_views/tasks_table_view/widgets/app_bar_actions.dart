import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solvro_mobile/services/auth_service.dart';
import 'package:solvro_mobile/services/projects_service.dart';

import '../../../../repositories/tasks_repository.dart';

class AppBarActions extends DelegatingList<Widget> {
  AppBarActions(BuildContext context)
      : super(
          [
            const AddUserActionIcon(),
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

class AddUserActionIcon extends ConsumerWidget {
  const AddUserActionIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(authServiceProvider).value?.id !=
            ref.watch(currentProjectSubServiceProvider).value?.owner.id ||
        ref.watch(authServiceProvider).value == null) return Container();
    return IconButton(
      onPressed: () {
        context.push("/addUsers");
      },
      icon: const Icon(
        Icons.person_add_alt,
        color: Colors.white,
      ),
    );
  }
}

class RefreshIcon extends ConsumerWidget {
  const RefreshIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
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
