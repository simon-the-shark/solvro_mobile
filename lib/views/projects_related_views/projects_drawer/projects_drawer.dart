import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/projects_repository.dart';
import '../../../services/projects_service.dart';
import '../../../widgets/name_header.dart';
import 'widgets/app_info_tile.dart';
import 'widgets/email_list_tile.dart';
import 'widgets/logout_button.dart';
import 'widgets/new_project_button.dart';
import 'widgets/profession_list_tile.dart';
import 'widgets/project_menu_item.dart';

class ProjectsDrawer extends ConsumerWidget {
  const ProjectsDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsServiceProvider).value;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    Widget projectsColumn = RefreshIndicator(
      onRefresh: () async => ref.refresh(projectsRepositoryProvider),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...projects?.map(
                  (e) => ProjectMenuItem(
                    project: e,
                    onTap: () {
                      ref
                          .read(currentProjectSubServiceProvider.notifier)
                          .setCurrentProject(e);
                      Scaffold.of(context).closeDrawer();
                    },
                  ),
                ) ??
                const [],
            const SizedBox(height: 20),
            const NewProjectButton(),
            // const SizedBox(height: 30),
          ],
        ),
      ),
    );
    if (!isLandscape) {
      projectsColumn = Expanded(child: projectsColumn);
    }
    final drawer = Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.2, 1.0],
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.inverseSurface,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 80,
                        child: Image.asset(
                          "assets/logo_solvro.png",
                        ),
                      ),
                      const SizedBox(height: 12),
                      NameHeader(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      const SizedBox(height: 20),
                      // const NameListTile(),
                      const EmailListTile(),
                      const ProfessionListTile(),
                      const SizedBox(height: 5),
                      const LogoutButton(),
                      const SizedBox(height: 25),
                    ]),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: Text(
                "Your projects: ",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            projectsColumn,
          ],
        ),
        const Positioned(bottom: 8, left: 8, child: AppInfoTile())
      ],
    );
    if (isLandscape) {
      return Drawer(child: SingleChildScrollView(child: drawer));
    }
    return Drawer(child: drawer);
  }
}
