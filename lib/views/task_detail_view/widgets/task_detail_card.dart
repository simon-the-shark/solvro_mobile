import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../models/users/user.dart';
import '../../new_task_view/widgets/status_header_and_title.dart';

class TaskDetailCard extends StatelessWidget {
  const TaskDetailCard({
    super.key,
    required this.task,
    required this.user,
    required this.creator,
  });

  final Task? task;
  final User? user;
  final User? creator;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(30.0),
        child: task == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WidgetStatusHeaderAndTitle(
                    statusChoice: task!.status,
                    showEstimation: task!.estimation,
                  ),
                  ListTile(
                    title: Text(task!.name),
                    subtitle: const Text("Task name"),
                  ),
                  ListTile(
                    title: Text(user?.representationName ?? "NOT ASSIGNED"),
                    subtitle: const Text("Assigned user"),
                  ),
                  ListTile(
                    title: Text(
                        EnumJsonConverter.valueString(task!.estimation) ?? ""),
                    subtitle: const Text("Estimation number"),
                  ),
                  ListTile(
                    title: Text(creator?.representationName ?? "NOT ASSIGNED"),
                    subtitle: const Text("Created by"),
                  ),
                  ListTile(
                    title: Text(
                      DateFormat.yMMMd("pl").add_jm().format(task!.createdAt),
                    ),
                    subtitle: const Text("Creation date"),
                  ),
                ],
              ));
  }
}