import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'project.dart';
import 'user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const Task._();

  factory Task({
    required String id,
    required Project project,
    required User createdBy,
    required User? assignedTo,
    required DateTime createdAt,
    required String name,
    required EstimationChoices estimation,
    required TaskStatusChoices status,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  Task assignTo(User user) {
    return copyWith(assignedTo: user);
  }

  Task copyWithName(String name) {
    return copyWith(name: name);
  }

  Task copyWithEstimation(EstimationChoices estimation) {
    return copyWith(estimation: estimation);
  }

  Task copyWithStatus(TaskStatusChoices status) {
    return copyWith(status: status);
  }
}
