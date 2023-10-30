import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';
import '../project/project.dart';
import '../user/user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
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
}
