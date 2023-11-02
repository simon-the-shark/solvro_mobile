import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/enums/enums.dart';
import '../../../services/auth_service.dart';

class ProfessionListTile extends ConsumerWidget {
  const ProfessionListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(EnumJsonConverter.valueString(
              ref.watch(authServiceProvider).value?.profession) ??
          ""),
      leading: const Icon(Icons.work_outline),
      iconColor: Theme.of(context).colorScheme.onTertiary,
      textColor: Theme.of(context).colorScheme.onTertiary,
    );
  }
}
