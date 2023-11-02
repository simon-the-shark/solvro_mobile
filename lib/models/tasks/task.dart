import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const Task._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Task({
    required int? id,
    required int project,
    required int createdBy,
    required int? assignedTo,
    required DateTime createdAt,
    required String name,
    required EstimationChoices estimation,
    required TaskStatusChoices status,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  Task assignTo(int user) {
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
