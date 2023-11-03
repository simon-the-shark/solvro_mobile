import 'package:flutter/material.dart';

class EmptyTaskStatusList extends StatelessWidget {
  const EmptyTaskStatusList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.folder_open,
              size: 30,
            ),
          ),
          Text("There's no tasks in this status group."),
        ],
      ),
    );
  }
}
