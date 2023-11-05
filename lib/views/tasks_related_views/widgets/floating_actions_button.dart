import 'package:flutter/material.dart';

import '../tasks_table_view/widgets/filter_expansion_section.dart';
import 'new_task_fab.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
          ),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const FilterExpansionSection());
            },
            child: Icon(
              Icons.filter_alt,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        const Spacer(),
        const NewTaskFloatingActionButton(),
      ],
    );
  }
}
