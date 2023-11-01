import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/projects_repository.dart';
import '../services/auth_service.dart';
import '../widgets/primary_button.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(projectsRepositoryProvider).getProjects().then(print);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Solvro Taskmanager'),
      ),
      body: Center(
        child: PrimaryButton(
          onPressed: () => ref.read(authServiceProvider.notifier).logout(),
          text: "Log out",
        ),
      ),
    );
  }
}
