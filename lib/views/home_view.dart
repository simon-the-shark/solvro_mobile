import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/projects_service.dart';
import 'projects_drawer/projects_drawer.dart';
import 'tasks_table_view/tasks_table_view.dart';
import 'tasks_table_view/widgets/new_task_fab.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const ProjectsDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title:
            Text("${ref.watch(currentProjectSubServiceProvider).value?.name}",
                style: GoogleFonts.grandstander(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
      ),
      body: const TasksTableView(),
      floatingActionButton: const NewTaskFloatingActionButton(),
    );
  }
}
