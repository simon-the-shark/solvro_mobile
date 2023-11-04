import 'package:flutter/material.dart';

import '../models/enums/enums.dart';

extension ColorsStatuses on TaskStatusChoices {
  List<Color>? get gradientColors {
    switch (this) {
      case TaskStatusChoices.notAssigned:
        return [
          Colors.yellow.shade800,
          Colors.yellow.shade500,
        ];
      case TaskStatusChoices.inProgress:
        return [
          Colors.blue.shade700,
          Colors.blue.shade300,
        ];
      case TaskStatusChoices.closed:
        return [
          Colors.grey.shade700,
          Colors.grey.shade500,
        ];
    }
  }
}

class StatusGradient extends LinearGradient {
  StatusGradient(BuildContext context, TaskStatusChoices statusChoice)
      : super(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.5, 1],
          colors: statusChoice.gradientColors ??
              [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.inverseSurface,
              ],
        );
}
