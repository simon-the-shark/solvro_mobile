import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/user_repository.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

part 'navigation_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter navigationRouter(NavigationRouterRef ref) {
  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      if (ref.read(userRepositoryProvider).value == null &&
          state.fullPath != "/signup") {
        return '/login';
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupView(),
      ),
    ],
  );
}
