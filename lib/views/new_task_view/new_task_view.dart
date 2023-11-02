import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums/enums.dart';
import '../../models/users/user.dart';
import '../../widgets/enum_dropdown_form_field.dart';
import '../../widgets/standard_text_form_field.dart';
import '../projects_drawer/projects_drawer_controller.dart';
import 'new_task_view_controller.dart';
import 'widgets/users_dropdown_form_field.dart';

class NewTaskView extends ConsumerWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newTaskViewControllerProvider);
    final controller = ref.watch(newTaskViewControllerProvider.notifier);
    final errorMap = controller.formatExceptionMap();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (state.isLoading)
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 70),
                    child: CircularProgressIndicator())),
          if (!state.isLoading) ...[
            StandardTextFormField(
              hintText: 'Your super new task',
              labelText: 'Task name',
              onChanged: controller.nameOnChanged,
              errorText: errorMap["name"],
            ),
            EnumDropdownFormField<EstimationChoices>(
              hintText: "Estimation number",
              items: EstimationChoices.values,
              onChanged: controller.estimationOnChanged,
              errorText: errorMap["estimation"],
            ),
            UsersDropdownFormField(
              hintText: "Assign to",
              itemsUsers: ref
                      .watch(currentProjectSubcontrollerProvider)
                      .value
                      ?.otherUsers ??
                  <User>[],
              onChanged: controller.onAssignedToChanged,
              errorText: errorMap["assignedTo"],
            ),
          ],
        ],
      ),
    );
  }
}
