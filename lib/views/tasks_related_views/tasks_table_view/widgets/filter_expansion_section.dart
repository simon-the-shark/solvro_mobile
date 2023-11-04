import 'package:flutter/material.dart';

import '../../../../models/enums/enums.dart';
import 'status_filter_chip.dart';

class FilterExpansionSection extends StatelessWidget {
  const FilterExpansionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedBackgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
        backgroundColor: Colors.white,
        title: const Text("Filter table options"),
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                StatusFilterChip(TaskStatusChoices.notAssigned),
                StatusFilterChip(TaskStatusChoices.inProgress),
                StatusFilterChip(TaskStatusChoices.closed),
              ],
            ),
          ),
        ]);
  }
}
