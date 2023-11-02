import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/name_header.dart';
import 'projects_drawer_controller.dart';
import 'widgets/email_list_tile.dart';
import 'widgets/logout_button.dart';
import 'widgets/name_list_tile.dart';
import 'widgets/new_project_button.dart';
import 'widgets/profession_list_tile.dart';
import 'widgets/project_menu_item.dart';

class ProjectsDrawer extends ConsumerWidget {
  const ProjectsDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsDrawerControllerProvider).value;
    return Drawer(
      child: Column(
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
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    const SizedBox(height: 20),
                    const NameListTile(),
                    const EmailListTile(),
                    const ProfessionListTile(),
                    const SizedBox(height: 5),
                    const LogoutButton(),
                    const SizedBox(height: 25),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Text(
              "Twoje projekty: ",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...projects?.map(
                        (e) => ProjectMenuItem(
                          project: e,
                          onTap: () {
                            ref
                                .read(currentProjectSubcontrollerProvider
                                    .notifier)
                                .setCurrentProject(e);
                            Scaffold.of(context).closeDrawer();
                          },
                        ),
                      ) ??
                      const [],
                  const SizedBox(height: 10),
                  const NewProjectButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
