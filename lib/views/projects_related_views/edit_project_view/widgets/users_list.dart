import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/projects_service.dart';
import '../edit_project_view_controller.dart';

class UsersList extends ConsumerWidget {
  const UsersList(this.projectId, {super.key});
  final int projectId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(editProjectViewControllerProvider(projectId));
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          )),
      child: SingleChildScrollView(
        child: Column(
          children: controller.value!.$1!.otherUsers.isNotEmpty
              ? controller.value!.$1!.otherUsers
                  .map((e) => ListTile(
                        title: Text(e.representationName),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(
                                    editProjectViewControllerProvider(projectId)
                                        .notifier)
                                .removeUser(e);
                          },
                        ),
                      ))
                  .toList()
              : [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        title: Text(
                          "You do not have any users in this project, you can proceed to add some by email in:",
                        ),
                      ),
                      TextButton(
                        onPressed: controller.isLoading
                            ? null
                            : () {
                                ref
                                    .read(currentProjectSubServiceProvider
                                        .notifier)
                                    .setCurrentProject(controller.value!.$1!)
                                    .then((value) =>
                                        context.replace("/addUsers"));
                              },
                        child: const Text(
                          "Go to add users section",
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
        ),
      ),
    );
  }
}
