import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'services/auth_service.dart';
import 'views/home_view.dart';
import 'views/login_view/login_view.dart';
import 'views/signup_view.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      if ((state.fullPath == "/signup" || state.fullPath == "/login") &&
          ref.watch(authServiceProvider).value != null) {
        return "/";
      } else if (ref.watch(authServiceProvider).value == null &&
          state.fullPath != "/signup" &&
          state.fullPath != "/login") {
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
});
