import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/projects_service.dart';
import '../widgets/standard_app_bar.dart';
import 'projects_drawer/projects_drawer.dart';
import 'tasks_related_views/tasks_table_view/tasks_table_view.dart';
import 'tasks_related_views/tasks_table_view/widgets/new_task_fab.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const ProjectsDrawer(),
      appBar: StandardAppBar(
        context,
        titleText: "${ref.watch(currentProjectSubServiceProvider).value?.name}",
      ),
      body: const TasksTableView(),
      floatingActionButton: const NewTaskFloatingActionButton(),
    );
  }
}
