import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'project.dart';
import 'user.dart';

part 'task.freezed.dart';

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
}
