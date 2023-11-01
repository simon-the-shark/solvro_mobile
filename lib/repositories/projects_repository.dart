import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/project.dart';
import 'api_details.dart';

final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) {
  return ProjectsRepository(ApiDetails(ref), Dio());
});

class ProjectsRepository {
  ProjectsRepository(this._apiDetails, this._dio);
  final Dio _dio;
  final ApiDetails _apiDetails;

  Future<List<Project>> getProjects() async {
    try {
      final response = await _dio.get(
        _apiDetails.projectsUrl,
        options: _apiDetails.authHeaders,
      );
      return response.data.map<Project>((e) => Project.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> addProject(String name, List<int> otherUsers) async {
    try {
      final response = await _dio.post(_apiDetails.projectsUrl,
          options: _apiDetails.authHeaders,
          data: {
            "name": name,
            "other_users": otherUsers,
          });
      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> updateProject(
      Project project, String newName, List<int> newOtherUsers) async {
    try {
      final response = await _dio.put(
          "${_apiDetails.projectsUrl}${project.id}/",
          options: _apiDetails.authHeaders,
          data: {
            "name": newName,
            "other_users": newOtherUsers,
          });
      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
