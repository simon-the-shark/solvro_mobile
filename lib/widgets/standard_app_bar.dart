import 'package:flutter/material.dart';

class StandardAppBar extends AppBar {
  StandardAppBar(
    BuildContext context, {
    super.key,
    List<Widget>? actions,
    required String titleText,
  }) : super(
          backgroundColor: Theme.of(context).colorScheme.primary,
          // centerTitle: true,
          title: Text(titleText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          actions: actions,
        );
}
