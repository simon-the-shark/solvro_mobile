import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums.dart';
import '../../services/auth_service.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/name_header.dart';
import '../../widgets/secondary_button.dart';
import 'projects_drawer_controller.dart';
import 'widgets/project_menu_item.dart';

class ProjectsDrawer extends ConsumerWidget {
  const ProjectsDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsDrawerControllerProvider).value?.$1;
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
                    ListTile(
                      title: Text(
                          ref.watch(authServiceProvider).value?.name ?? ""),
                      leading: const Icon(Icons.person),
                      dense: true,
                      iconColor: Theme.of(context).colorScheme.onSecondary,
                      textColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                          ref.watch(authServiceProvider).value?.email ?? ""),
                      leading: const Icon(Icons.email),
                      iconColor: Theme.of(context).colorScheme.onTertiary,
                      textColor: Theme.of(context).colorScheme.onTertiary,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(EnumJsonConverter.valueString(ref
                              .watch(authServiceProvider)
                              .value
                              ?.profession) ??
                          ""),
                      leading: const Icon(Icons.work_outline),
                      iconColor: Theme.of(context).colorScheme.onTertiary,
                      textColor: Theme.of(context).colorScheme.onTertiary,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientButton(
                          onPressed: () =>
                              ref.read(authServiceProvider.notifier).logout(),
                          text: "Log out",
                        ),
                      ],
                    ),
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
                                .read(projectsDrawerControllerProvider.notifier)
                                .setCurrentProject(e);
                            Scaffold.of(context).closeDrawer();
                          },
                        ),
                      ) ??
                      const [],
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryButton(
                      onPressed: () {},
                      text: "Dodaj nowy projekt",
                    ),
                  ),
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
