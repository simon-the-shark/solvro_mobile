import 'package:flutter/material.dart';

import '../../../models/enums/enums.dart';

class ExpansionTitle extends StatelessWidget {
  const ExpansionTitle(
    this.statusChoice, {
    super.key,
  });

  final TaskStatusChoices statusChoice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        EnumJsonConverter.valueString(statusChoice) ?? "",
        style: Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
            ),
      ),
    );
  }
}
