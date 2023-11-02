import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/project.dart';
import '../models/task.dart';
import 'api_details.dart';

final projectsRepositoryProvider = Provider<TasksRepository>((ref) {
  return TasksRepository(ApiDetails(ref), Dio());
});

class TasksRepository {
  final Dio _dio;
  final ApiDetails _apiDetails;

  TasksRepository(this._apiDetails, this._dio);

  Future<List<Task>?> getTasks(Project currProject) async {
    try {
      final response = await _dio.get(
        _apiDetails.tasksUrl(currProject.id),
        options: _apiDetails.authHeaders,
      );
      return response.data.map<Task>((e) => Task.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> addTask(Task task) async {
    try {
      final response = await _dio.post(
        _apiDetails.tasksUrl(task.project),
        options: _apiDetails.authHeaders,
        data: task.toJson(),
      );
      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final response = await _dio.put(
        _apiDetails.tasksUrlForTask(task),
        options: _apiDetails.authHeaders,
        data: task.toJson(),
      );
      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
