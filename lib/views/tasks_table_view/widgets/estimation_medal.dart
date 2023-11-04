import 'package:flutter/material.dart';

import '../../../models/enums/enums.dart';
import '../../../models/tasks/task.dart';

class EstimationMedal extends StatelessWidget {
  const EstimationMedal({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 37,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: const [0.48, 1],
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer
          ],
        ),
        // color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Text(
          EnumJsonConverter.valueString(task.estimation) ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
