import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../add_users_view_controller.dart';

class EmailList extends ConsumerWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProvider = ref.watch(addUsersViewControllerProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          )),
      child: SingleChildScrollView(
        child: Column(
          children: stateProvider.value!.isNotEmpty
              ? stateProvider.value!
                  .map((e) => ListTile(
                        title: Text(e),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(addUsersViewControllerProvider.notifier)
                                .deleteEmail(e);
                          },
                        ),
                      ))
                  .toList()
              : [
                  const ListTile(
                    title: Text(
                      "Here will be displayed your current list of email invitations (doesn't mean there's no other users in your project at the moment)",
                    ),
                  )
                ],
        ),
      ),
    );
  }
}
