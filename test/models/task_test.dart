import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/enums.dart';
import 'package:solvro_mobile/models/task.dart';

void main() {
  group('Task tests', () {
    final task = Task(
      id: 1,
      project: 2,
      createdBy: 3,
      assignedTo: 4,
      createdAt: DateTime(2023, 1, 1),
      name: 'Task 1',
      estimation: EstimationChoices.one,
      status: TaskStatusChoices.inProgress,
    );

    test('Task creation', () {
      expect(
          task,
          Task(
            id: 1,
            project: 2,
            createdBy: 3,
            assignedTo: 4,
            createdAt: DateTime(2023, 1, 1),
            name: 'Task 1',
            estimation: EstimationChoices.one,
            status: TaskStatusChoices.inProgress,
          ));
    });

    test('Task assignTo', () {
      final updatedTask = task.assignTo(5);
      expect(
          updatedTask,
          Task(
            id: task.id,
            project: task.project,
            createdBy: task.createdBy,
            assignedTo: 5,
            createdAt: task.createdAt,
            name: task.name,
            estimation: task.estimation,
            status: task.status,
          ));
    });

    test('Task copyWithName', () {
      final updatedTask = task.copyWithName('Updated Task');
      expect(
          updatedTask,
          Task(
            id: task.id,
            project: task.project,
            createdBy: task.createdBy,
            assignedTo: task.assignedTo,
            createdAt: task.createdAt,
            name: 'Updated Task',
            estimation: task.estimation,
            status: task.status,
          ));
    });

    test('Task copyWithEstimation', () {
      final updatedTask = task.copyWithEstimation(EstimationChoices.twentyOne);
      expect(
          updatedTask,
          Task(
            id: task.id,
            project: task.project,
            createdBy: task.createdBy,
            assignedTo: task.assignedTo,
            createdAt: task.createdAt,
            name: task.name,
            estimation: EstimationChoices.twentyOne,
            status: task.status,
          ));
    });

    test('Task copyWithStatus', () {
      final updatedTask = task.copyWithStatus(TaskStatusChoices.closed);
      expect(
          updatedTask,
          Task(
            id: task.id,
            project: task.project,
            createdBy: task.createdBy,
            assignedTo: task.assignedTo,
            createdAt: task.createdAt,
            name: task.name,
            estimation: task.estimation,
            status: TaskStatusChoices.closed,
          ));
    });

    test('Task JSON serialization and deserialization', () {
      final jsonMap = task.toJson();
      final fromJsonTask = Task.fromJson(jsonMap);

      expect(fromJsonTask, task);
    });
  });
}
