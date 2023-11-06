import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../services/projects_service.dart';
import '../widgets/standard_app_bar.dart';
import 'projects_related_views/projects_drawer/projects_drawer.dart';
import 'tasks_related_views/tasks_table_view/tasks_table_view.dart';
import 'tasks_related_views/tasks_table_view/widgets/app_bar_actions.dart';
import 'tasks_related_views/widgets/floating_actions_button.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: ResponsiveBreakpoints.of(context).largerThan('HIDE_DRAWER')
          ? null
          : const ProjectsDrawer(),
      appBar: StandardAppBar(
        context,
        titleText: "${ref.watch(currentProjectSubServiceProvider).value?.name}",
        actions: AppBarActions(context),
      ),
      body: const TasksTableView(),
      floatingActionButton: const FloatingActionButtons(),
    );
  }
}
