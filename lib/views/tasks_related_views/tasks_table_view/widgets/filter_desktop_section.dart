import 'package:flutter/material.dart';

import '../../../../models/enums/enums.dart';
import 'status_filter_chip.dart';

class FilterDesktopSection extends StatelessWidget {
  const FilterDesktopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatusFilterChip(TaskStatusChoices.notAssigned),
          SizedBox(width: 10),
          StatusFilterChip(TaskStatusChoices.inProgress),
          SizedBox(width: 10),
          StatusFilterChip(TaskStatusChoices.closed),
        ],
      ),
    );
  }
}
