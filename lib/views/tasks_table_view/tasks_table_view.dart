import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/tasks_repository.dart';
import '../../services/projects_service.dart';

class TasksTableView extends ConsumerWidget {
  const TasksTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(currentProjectSubServiceProvider).value != null) {
      ref
          .watch(tasksRepositoryProvider)
          .getTasks(ref.watch(currentProjectSubServiceProvider).value!)
          .then(print);
    }
    return const Placeholder();
  }
}
