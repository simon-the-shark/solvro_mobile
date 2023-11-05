import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/projects/project.dart';
import '../../../../services/auth_service.dart';

class ProjectMenuItem extends ConsumerWidget {
  final void Function() onTap;

  const ProjectMenuItem(
      {super.key, required this.project, required this.onTap});

  final Project project;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).value;
    final isOwner = project.owner.id == user?.id;
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
                child: GestureDetector(
                  onTap: isOwner
                      ? null
                      : () {
                          Fluttertoast.showToast(
                            msg: "Only project's owner can edit",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        },
                  child: IconButton(
                    onPressed: isOwner
                        ? () {
                            context.push("/projects/edit/${project.id}");
                          }
                        : null,
                    icon: Icon(
                      Icons.settings,
                      color: isOwner
                          ? Theme.of(context).colorScheme.inverseSurface
                          : Colors.grey,
                      size: 20,
                    ),
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
