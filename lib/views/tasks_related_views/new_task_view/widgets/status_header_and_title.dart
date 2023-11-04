import 'package:flutter/material.dart';

import '../../../../models/enums/enums.dart';
import '../../../../widgets/status_header_tile.dart';
import '../../tasks_table_view/widgets/estimation_medal.dart';
import '../../tasks_table_view/widgets/expansion_title.dart';

class WidgetStatusHeaderAndTitle extends StatelessWidget {
  const WidgetStatusHeaderAndTitle({
    super.key,
    required this.statusChoice,
    this.showEstimation,
  });

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
          trailing: AnimatedOpacity(
            opacity: showEstimation == null ? 0 : 1,
            duration: duration,
            child: EstimationMedal(estimation: showEstimation),
          ),
        ),
      ],
    );
  }
}
