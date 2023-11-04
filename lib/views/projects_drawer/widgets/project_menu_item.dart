import 'package:flutter/material.dart';

import '../../../models/projects/project.dart';

class ProjectMenuItem extends StatelessWidget {
  final void Function() onTap;

  const ProjectMenuItem(
      {super.key, required this.project, required this.onTap});

  final Project project;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              onTap: onTap,
              dense: true,
              leading: Transform.translate(
                offset: const Offset(-10, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inverseSurface,
                    size: 20,
                  ),
                ),
              ),
              trailing: const Icon(Icons.navigate_next_sharp),
              title: Transform.translate(
                offset: const Offset(-10, 0),
                child: Text(
                  project.name,
                  style:
                      Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 16,
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
