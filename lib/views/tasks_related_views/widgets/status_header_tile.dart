import 'package:flutter/material.dart';

import '../../../models/enums/enums.dart';
import 'gradients.dart';

class StatusHeaderTile extends StatelessWidget {
  const StatusHeaderTile({
    super.key,
    required this.statusChoice,
    required this.isExpanded,
  });

  final TaskStatusChoices statusChoice;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 75,
      decoration: BoxDecoration(
        gradient: StatusGradient(context, statusChoice),
        borderRadius: isExpanded
            ? const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )
            : BorderRadius.circular(12),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
