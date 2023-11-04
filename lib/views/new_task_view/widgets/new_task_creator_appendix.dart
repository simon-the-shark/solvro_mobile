import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/auth_service.dart';
import 'current_datetime_text.dart';

class NewTaskCreatorAppendix extends ConsumerWidget {
  const NewTaskCreatorAppendix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ListTile(
            title: Text(
                ref.watch(authServiceProvider).value?.representationName ?? ""),
            subtitle: const Text("Created by"),
          ),
          const ListTile(
            title: CurrentDateTimeText(),
            subtitle: Text("Creation date"),
          ),
        ],
      ),
    );
  }
}
