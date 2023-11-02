import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solvro_mobile/services/auth_service.dart';

class NameListTile extends ConsumerWidget {
  const NameListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(ref.watch(authServiceProvider).value?.name ?? ""),
      leading: const Icon(Icons.person),
      dense: true,
      iconColor: Theme.of(context).colorScheme.onSecondary,
      textColor: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
