import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/users/user.dart';
import '../../../services/auth_service.dart';
import '../new_task_view/widgets/current_datetime_text.dart';

class NewTaskCreatorAppendix extends ConsumerWidget {
  const NewTaskCreatorAppendix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CreatorAppendix(
      createdBy: ref.watch(authServiceProvider).value,
      datetime: null,
    );
  }
}

class CreatorAppendix extends ConsumerWidget {
  const CreatorAppendix({
    super.key,
    required this.createdBy,
    required this.datetime,
  });

  final User? createdBy;
  final DateTime? datetime;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ListTile(
            title: Text(createdBy?.representationName ?? ""),
            subtitle: const Text("Created by"),
          ),
          ListTile(
            title: datetime == null
                ? const CurrentDateTimeText()
                : Text(
                    DateFormat.yMMMd("pl").add_Hm().format(datetime!),
                  ),
            subtitle: const Text("Creation date"),
          ),
        ],
      ),
    );
  }
}
