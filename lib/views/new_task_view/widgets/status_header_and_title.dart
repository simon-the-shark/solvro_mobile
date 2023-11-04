import 'package:flutter/material.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';
import '../../../widgets/status_header_tile.dart';
import '../../tasks_table_view/widgets/estimation_medal.dart';
import '../../tasks_table_view/widgets/expansion_title.dart';

class WidgetStatusHeaderAndTitle extends StatelessWidget {
  const WidgetStatusHeaderAndTitle({
    super.key,
    required this.statusChoice,
    this.showMedalTask,
  });

  final TaskStatusChoices statusChoice;
  final Task? showMedalTask;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StatusHeaderTile(
          statusChoice: statusChoice,
          isExpanded: true,
        ),
        ListTile(
          title: ExpansionTitle(statusChoice),
          trailing: showMedalTask == null
              ? null
              : EstimationMedal(
                  task: showMedalTask!,
                ),
        ),
      ],
    );
  }
}
