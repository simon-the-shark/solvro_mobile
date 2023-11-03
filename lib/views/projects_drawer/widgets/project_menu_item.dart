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
      child: GestureDetector(
        onTap: onTap,
        child: FilterChip(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          avatar: Icon(
            Icons.folder,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          label: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  project.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ),
            ],
          ),
          onSelected: (bool value) {},
        ),
      ),
    );
  }
}
