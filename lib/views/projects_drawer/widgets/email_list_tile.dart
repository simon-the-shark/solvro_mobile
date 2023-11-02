import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/auth_service.dart';

class EmailListTile extends ConsumerWidget {
  const EmailListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(ref.watch(authServiceProvider).value?.email ?? ""),
      leading: const Icon(Icons.email),
      iconColor: Theme.of(context).colorScheme.onTertiary,
      textColor: Theme.of(context).colorScheme.onTertiary,
    );
  }
}
