import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'projects_drawer/projects_drawer.dart';
import 'projects_drawer/projects_drawer_controller.dart';
import 'tasks_table_view/widgets/new_task_fab.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const ProjectsDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "${ref.watch(currentProjectSubcontrollerProvider).value?.name}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: const Placeholder(),
      floatingActionButton: const NewTaskFloatingActionButton(),
    );
  }
}
