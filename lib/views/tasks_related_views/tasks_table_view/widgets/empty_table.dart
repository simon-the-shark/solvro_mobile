import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/enums/enums.dart';
import '../task_type_subtable_controller.dart';

class EmptyTable extends ConsumerWidget {
  const EmptyTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider1 = ref.watch(
        taskTypeSubtableControllerProvider(TaskStatusChoices.notAssigned));
    final provider2 = ref.watch(
        taskTypeSubtableControllerProvider(TaskStatusChoices.inProgress));
    final provider3 =
        ref.watch(taskTypeSubtableControllerProvider(TaskStatusChoices.closed));

    final show = !provider1.isLoading &&
        !provider2.isLoading &&
        !provider3.isLoading &&
        provider1.value == null &&
        provider2.value == null &&
        provider3.value == null;
    if (!show) {
      return Container();
    }
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 150),
        child: Text(
          "You gotta choose some columns in filter table options to see some sections",
        ),
      ),
    );
  }
}
