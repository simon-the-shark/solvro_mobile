import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums/enums.dart';
import '../../models/users/user.dart';
import '../../services/projects_service.dart';
import '../../widgets/enum_dropdown_form_field.dart';
import '../../widgets/gradient_button_primary.dart';
import '../../widgets/loader_widget_wrapper.dart';
import '../../widgets/standard_text_form_field.dart';
import 'new_task_view_controller.dart';
import 'widgets/users_dropdown_form_field.dart';

class NewTaskView extends ConsumerWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newTaskViewControllerProvider);
    final controller = ref.watch(newTaskViewControllerProvider.notifier);
    final errorMap = controller.formatExceptionMap();
    final scaffoldWidget = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
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
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1],
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.primary,
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Your super new task",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .labelLarge!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                          ),
                    ),
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
                            ?.otherUsers ??
                        <User>[],
                    onChanged: controller.onAssignedToChanged,
                    errorText: errorMap["assignedTo"],
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            GradientButtonPrimary(
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
