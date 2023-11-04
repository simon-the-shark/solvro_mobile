import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'go_router.dart';
import 'widgets/app_bar_buttons.dart';

void main() async {
  await initializeDateFormatting('pl', null);
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
          backButtonIconBuilder: (context) => const BackIcon(),
        ),
      ),
    );
  }
}
