import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'go_router.dart';
import 'widgets/hamburger_menu.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Solvro Taskmanager',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E4272)),
          useMaterial3: true,
          actionIconTheme: ActionIconThemeData(
            drawerButtonIconBuilder: (context) => const HamburgerMenu(),
          )),
    );
  }
}
