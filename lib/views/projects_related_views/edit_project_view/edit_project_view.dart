import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/max_width_box.dart';

import '../../../widgets/primary_button.dart';
import '../../../widgets/standard_app_bar.dart';
import '../../../widgets/standard_text_form_field.dart';
import 'edit_project_view_controller.dart';
import 'widgets/users_list.dart';

class EditProjectView extends ConsumerWidget {
  const EditProjectView(this.projectId, {super.key});
  final int projectId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(editProjectViewControllerProvider(projectId));
    return Scaffold(
      appBar: StandardAppBar(
        context,
        titleText: 'Edit: ${project.value?.$2 ?? ''}',
      ),
      body: project.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: MaxWidthBox(
                maxWidth: 700,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 50),
                      StandardTextFormField(
                        initValue: project.value?.$2,
                        hintText: "${project.value?.$2}",
                        labelText: "Project name",
                        onChanged: ref
                            .watch(editProjectViewControllerProvider(projectId)
                                .notifier)
                            .nameOnChanged,
                        errorText: ref
                            .watch(editProjectViewControllerProvider(projectId)
                                .notifier)
                            .formatExceptionMap()["name"],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25, top: 40),
                        child: Text(
                          "Other users in your project:",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      UsersList(projectId),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Text(
                          "As long you don't save changes, there will be no effective change to your actions in this page (including deleted users)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            onPressed: () {
                              ref
                                  .read(EditProjectViewControllerProvider(
                                          projectId)
                                      .notifier)
                                  .editProject();
                            },
                            text: "Save changes",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
