import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/tasks/task.dart';
import '../services/auth_service.dart';

class ApiDetails {
  const ApiDetails(
    this._ref, {
    this.apiMasterUrl = "http://localhost:8000/api/",
    String loginApndx = "auth/login/",
    String registerApndx = "auth/register/",
    String logoutApndx = "auth/logout/",
    String projectsApndx = "projects/",
    String tasksApndx = "tasks/",
  })  : _loginApndx = loginApndx,
        _logoutApndx = logoutApndx,
        _registerApndx = registerApndx,
        _projectsApndx = projectsApndx,
        _tasksApndx = tasksApndx;
  final String apiMasterUrl;
  final String _loginApndx;
  final String _registerApndx;
  final String _logoutApndx;
  final String _projectsApndx;
  final String _tasksApndx;

  final ProviderRef _ref;

  String get loginUrl => apiMasterUrl + _loginApndx;
  String get registerUrl => apiMasterUrl + _registerApndx;
  String get logoutUrl => apiMasterUrl + _logoutApndx;
  String get projectsUrl => apiMasterUrl + _projectsApndx;
  String tasksUrl(int projectId) =>
      "$apiMasterUrl$_projectsApndx$projectId/$_tasksApndx";
  String tasksUrlForTask(Task task) => "${tasksUrl(task.project)}/${task.id}/";

  Options? get authHeaders => Options(headers: {
        "Authorization": "Token ${_ref.read(authServiceProvider).value?.token}"
      });
}
