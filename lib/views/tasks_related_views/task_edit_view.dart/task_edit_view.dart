import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../widgets/enum_dropdown_form_field.dart';
import '../../../widgets/loader_widget_wrapper.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/standard_app_bar.dart';
import '../../../widgets/standard_text_form_field.dart';
import '../new_task_view/widgets/users_dropdown_form_field.dart';
import '../widgets/creator_appendix.dart';
import '../widgets/status_header_and_title.dart';
import 'task_edit_view_controller.dart';

class TaskEditView extends ConsumerWidget {
  const TaskEditView({super.key, required this.taskId});
  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = taskEditViewControllerProvider(taskId);
    final state = ref.watch(provider);
    if (state.isLoading) return LoaderWidgetWrapper(child: Container());
    final controller = ref.watch(provider.notifier);
    final errorMap = controller.formatExceptionMap();
    final users = state.value!.$1;
    final task = state.value!.$2;
    return Scaffold(
      appBar: StandardAppBar(
        context,
        titleText: "EDIT TASK",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WidgetStatusHeaderAndTitle(
                    statusChoice: task.status,
                    showEstimation: task.estimation,
                  ),
                  const SizedBox(height: 45),
                  StandardTextFormField(
                    hintText: 'Your new name for this task',
                    labelText: 'Task name',
                    onChanged: controller.nameOnChanged,
                    initValue: task.name,
                    errorText: errorMap["name"],
                  ),
                  const SizedBox(height: 10),
                  EnumDropdownFormField<EstimationChoices>(
                    hintText: "Estimation number",
                    initialValue: task.estimation,
                    labelText: "Estimation number",
                    items: EstimationChoices.values,
                    onChanged: controller.estimationOnChanged,
                    errorText: errorMap["estimation"],
                  ),
                  const SizedBox(height: 10),
                  EnumDropdownFormField<TaskStatusChoices>(
                    hintText: "Status",
                    initialValue: task.status,
                    labelText: "Status",
                    items: TaskStatusChoices.values,
                    onChanged: controller.onStatusChanged,
                    errorText: errorMap["status"],
                  ),
                  const SizedBox(height: 10),
                  UsersDropdownFormField(
                    hintText: "Assign to",
                    labelText: "Assign to",
                    initialUser: users.firstWhereOrNull(
                        (element) => element.id == task.assignedTo),
                    itemsUsers: users,
                    onChanged: controller.onAssignedToChanged,
                    errorText: errorMap["assignedTo"],
                  ),
                  const SizedBox(height: 20),
                  CreatorAppendix(
                    createdBy: users.firstWhereOrNull(
                        (element) => element.id == task.createdBy),
                    datetime: task.createdAt,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              size: const Size(200, 45),
              onPressed: controller.editTask,
              text: "Edit task",
            ),
          ],
        ),
      ),
    );
  }
}
