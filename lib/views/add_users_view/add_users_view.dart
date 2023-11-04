import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/projects_service.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/standard_app_bar.dart';
import 'add_users_view_controller.dart';
import 'widgets/email_list.dart';
import 'widgets/multi_email_field.dart';

class AddUsersView extends ConsumerStatefulWidget {
  const AddUsersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUsersViewState();
}

class _AddUsersViewState extends ConsumerState<AddUsersView> {
  @override
  Widget build(BuildContext context) {
    final stateProvider = ref.watch(addUsersViewControllerProvider);
    final currentProjectProv = ref.watch(currentProjectSubServiceProvider);
    return Scaffold(
      appBar: StandardAppBar(
        context,
        titleText: "Add users",
      ),
      body: stateProvider.isLoading || currentProjectProv.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    ListTile(
                      title: Text("Let's "
                          'add some users to your current project: "${currentProjectProv.value!.name}"'),
                    ),
                    const ListTile(
                      title: Text(
                          "You can type as many emails as you like, and those connected to an account in our app, will be added to your projects as collaborants."),
                    ),
                  ]),
                ),
                const MultiEmailField(),
                const EmailList(),
                PrimaryButton(
                    onPressed: () {
                      ref
                          .read(addUsersViewControllerProvider.notifier)
                          .sendEmails(currentProjectProv.value!);
                    },
                    text: "Add all"),
                const SizedBox(height: 60),
              ]),
            ),
    );
  }
}
