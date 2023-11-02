import 'package:flutter/material.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Solvro Taskmanager",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: color,
          ),
    );
  }
}