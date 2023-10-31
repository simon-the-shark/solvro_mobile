import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dependency_injection/navigation_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(navigationRouterProvider),
      title: 'Solvro Taskmanager',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade400),
        useMaterial3: true,
      ),
    );
  }
}
