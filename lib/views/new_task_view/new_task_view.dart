import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums/enums.dart';
import '../../models/users/user.dart';
import '../../services/projects_service.dart';
import '../../widgets/enum_dropdown_form_field.dart';
import '../../widgets/loader_widget_wrapper.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/standard_app_bar.dart';
import '../../widgets/standard_text_form_field.dart';
import '../../widgets/status_header_tile.dart';
import '../tasks_table_view/widgets/expansion_title.dart';
import 'new_task_view_controller.dart';
import 'widgets/users_dropdown_form_field.dart';

class NewTaskView extends ConsumerStatefulWidget {
  const NewTaskView({super.key});

  @override
  ConsumerState<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends ConsumerState<NewTaskView> {
  bool isAssigned = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newTaskViewControllerProvider);
    final controller = ref.watch(newTaskViewControllerProvider.notifier);
    final errorMap = controller.formatExceptionMap();
    final scaffoldWidget = Scaffold(
      appBar: StandardAppBar(
        context,
        titleText: "ADD NEW TASK",
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
                  Stack(
                    children: [
                      StatusHeaderTile(
                        statusChoice: isAssigned
                            ? TaskStatusChoices.inProgress
                            : TaskStatusChoices.notAssigned,
                        isExpanded: true,
                      ),
                      ListTile(
                        title: ExpansionTitle(
                          isAssigned
                              ? TaskStatusChoices.inProgress
                              : TaskStatusChoices.notAssigned,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  StandardTextFormField(
                    hintText: 'Your super new task',
                    labelText: 'Task name',
                    onChanged: controller.nameOnChanged,
                    errorText: errorMap["name"],
                  ),
                  const SizedBox(height: 10),
                  EnumDropdownFormField<EstimationChoices>(
                    hintText: "Estimation number",
                    labelText: "Estimation number",
                    items: EstimationChoices.values,
                    onChanged: controller.estimationOnChanged,
                    errorText: errorMap["estimation"],
                  ),
                  const SizedBox(height: 10),
                  UsersDropdownFormField(
                    hintText: "Assign to",
                    labelText: "Assign to",
                    itemsUsers: ref
                            .watch(currentProjectSubServiceProvider)
                            .value
                            ?.allUsers ??
                        <User>[],
                    onChanged: (p0) {
                      setState(() {
                        isAssigned = p0 != null;
                      });
                      controller.onAssignedToChanged(p0);
                    },
                    errorText: errorMap["assignedTo"],
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            PrimaryButton(
              size: const Size(200, 45),
              onPressed: controller.saveTask,
              text: "Add task",
            ),
          ],
        ),
      ),
    );
    if (state.isLoading) return LoaderWidgetWrapper(child: scaffoldWidget);
    return scaffoldWidget;
  }
}
