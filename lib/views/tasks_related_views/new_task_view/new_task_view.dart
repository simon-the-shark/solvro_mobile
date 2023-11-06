import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/max_width_box.dart';

import '../../../models/enums/enums.dart';
import '../../../models/users/user.dart';
import '../../../widgets/enum_dropdown_form_field.dart';
import '../../../widgets/loader_widget_wrapper.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/standard_app_bar.dart';
import '../../../widgets/standard_text_form_field.dart';
import '../widgets/creator_appendix.dart';
import '../widgets/status_header_and_title.dart';
import 'new_task_view_controller.dart';
import 'widgets/users_dropdown_form_field.dart';

class NewTaskView extends ConsumerStatefulWidget {
  const NewTaskView({super.key});

  @override
  ConsumerState<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends ConsumerState<NewTaskView> {
  bool isAssigned = false;
  EstimationChoices? estimation;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newTaskViewControllerProvider);
    final controller = ref.watch(newTaskViewControllerProvider.notifier);
    final errorMap = controller.formatExceptionMap();
    final users = state.value;

    final scaffoldWidget = Scaffold(
      appBar: StandardAppBar(
        context,
        titleText: "ADD NEW TASK",
      ),
      body: SingleChildScrollView(
        child: Center(
          child: MaxWidthBox(
            maxWidth: 550,
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 20,
                  margin: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      WidgetStatusHeaderAndTitle(
                        statusChoice: isAssigned
                            ? TaskStatusChoices.inProgress
                            : TaskStatusChoices.notAssigned,
                        showEstimation: estimation,
                      ),
                      const SizedBox(height: 20),
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
                        onChanged: (p0) {
                          setState(() {
                            estimation = p0;
                          });
                          controller.estimationOnChanged(p0);
                        },
                        errorText: errorMap["estimation"],
                      ),
                      const SizedBox(height: 10),
                      UsersDropdownFormField(
                        hintText: "Assign to",
                        labelText: "Assign to",
                        itemsUsers: users ?? <User>[],
                        onChanged: (p0) {
                          setState(() {
                            isAssigned = p0 != null;
                          });
                          controller.onAssignedToChanged(p0);
                        },
                        errorText: errorMap["assignedTo"],
                      ),
                      // TextButtons const Text("Auto assignment proposition")),
                      const SizedBox(height: 20),
                      const NewTaskCreatorAppendix(),
                      Column(
                        children: [
                          const SizedBox(height: 15),
                          PrimaryButton(
                            size: const Size(200, 45),
                            onPressed: controller.saveTask,
                            text: "Add task",
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (state.isLoading) return LoaderWidgetWrapper(child: scaffoldWidget);
    return scaffoldWidget;
  }
}
