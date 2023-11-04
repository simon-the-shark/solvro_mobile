import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'services/auth_service.dart';
import 'views/home_view.dart';
import 'views/login_view/login_view.dart';
import 'views/signup_view/signup_view.dart';
import 'views/tasks_related_views/new_task_view/new_task_view.dart';
import 'views/tasks_related_views/task_detail_view/task_detail_view.dart';

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
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: '/newTask',
        builder: (context, state) => const NewTaskView(),
      ),
      GoRoute(
        path: '/tasks/:taskId',
        builder: (context, state) =>
            TaskDetailView(taskId: int.parse(state.pathParameters['taskId']!)),
      ),
    ],
  );
});
