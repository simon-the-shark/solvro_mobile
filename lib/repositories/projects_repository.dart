import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/projects/project.dart';
import '../services/auth_service.dart';
import 'api_details.dart';

final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) {
  return ProjectsRepository(ApiDetails(ref), Dio(), ref);
});

class ProjectsRepository {
  ProjectsRepository(this._apiDetails, this._dio, this._ref);
  final Dio _dio;
  final ApiDetails _apiDetails;
  final ProviderRef<ProjectsRepository> _ref;

  Future<List<Project>> getProjects() async {
    try {
      final response = await _dio.get(
        _apiDetails.projectsUrl,
        options: _apiDetails.authHeaders,
      );
      return response.data
          .map<Project>((e) => Project.fromJson(e))
          .toSet()
          .toList();
    } on DioException catch (e) {
      if ((e.response?.data as Map<String, dynamic>?)?["detail"] ==
          "Niepoprawny token.") {
        _ref.read(authServiceProvider.notifier).logout();
      }
      throw Exception(e.response);
    }
  }

  Future<void> addProject(String name) async {
    try {
      final response = await _dio.post(_apiDetails.projectsUrl,
          options: _apiDetails.authHeaders,
          data: {
            "name": name,
          });
      print(response.data);
      _ref.invalidateSelf();
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> updateProject(Project project) async {
    try {
      final response = await _dio.put(
          "${_apiDetails.projectsUrl}${project.id}/",
          options: _apiDetails.authHeaders,
          data: {
            "name": project.name,
            "other_users_ids": project.otherUsers.map((e) => e.id).toList(),
          });
      print(response.data);
      _ref.invalidateSelf();
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> addUsersToProjectsByEmails(
      Project project, List<String> emails) async {
    try {
      final response = await _dio.post(
          "${_apiDetails.projectsUrl}${project.id}/add-users-to-project/",
          options: _apiDetails.authHeaders,
          data: {
            "emails": emails,
          });
      print(response.data);
      _ref.invalidateSelf();
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
