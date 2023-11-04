import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/enums/enums.dart';
import '../task_type_subtable_controller.dart';

class StatusFilterChip extends ConsumerWidget {
  const StatusFilterChip(this.statusChoice, {super.key});
  final TaskStatusChoices statusChoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider =
        ref.watch(taskTypeSubtableControllerProvider(statusChoice));
    final selected = provider.value != null && !provider.isLoading;
    return FilterChip(
      selected: selected,
      showCheckmark: true,
      shape: const StadiumBorder(),
      label: Text(EnumJsonConverter.valueString(statusChoice) ?? ""),
      onSelected: (b) {
        ref
            .read(taskTypeSubtableControllerProvider(statusChoice).notifier)
            .setShowFilterState(b);
      },
    );
  }
}
