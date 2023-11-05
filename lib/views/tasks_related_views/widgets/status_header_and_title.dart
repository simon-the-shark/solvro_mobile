import 'package:flutter/material.dart';

import '../../../models/enums/enums.dart';
import '../tasks_table_view/widgets/expansion_title.dart';
import 'estimation_medal.dart';
import 'status_header_tile.dart';

class WidgetStatusHeaderAndTitle extends StatelessWidget {
  const WidgetStatusHeaderAndTitle({
    super.key,
    required this.statusChoice,
    this.showEstimation,
    this.showCloseButton = false,
  });
  final bool showCloseButton;
  final TaskStatusChoices statusChoice;
  final EstimationChoices? showEstimation;
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Stack(
      children: [
        StatusHeaderTile(
          statusChoice: statusChoice,
          isExpanded: true,
        ),
        ListTile(
          title: ExpansionTitle(statusChoice),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!showCloseButton)
                AnimatedOpacity(
                  opacity: showEstimation == null ? 0 : 1,
                  duration: duration,
                  child: EstimationMedal(estimation: showEstimation),
                ),
              if (showCloseButton)
                Transform.translate(
                  offset: const Offset(16, 0),
                  child: IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        color: statusChoice == TaskStatusChoices.notAssigned
                            ? Colors.black87
                            : Colors.white,
                      )),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
