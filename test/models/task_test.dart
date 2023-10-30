import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/enums.dart';
import 'package:solvro_mobile/models/project.dart';
import 'package:solvro_mobile/models/task.dart';
import 'package:solvro_mobile/models/user.dart';

void main() {
  group('Task Tests', () {
    late Task task;
    late User user;
    late Project project;

    setUp(() {
      user = User(
          id: 'user_id',
          email: 'user@example.com',
          profession: ProfessionChoices.frontend,
          name: 'John Doe');
      project = Project(
          id: 'project_id', name: 'Project 1', owner: user, otherUsers: []);
      task = Task(
        id: 'task_id',
        project: project,
        createdBy: user,
        assignedTo: null,
        createdAt: DateTime.now(),
        name: 'Task 1',
        estimation: EstimationChoices.one,
        status: TaskStatusChoices.notAssigned,
      );
    });

    test('assignTo should assign the task to a user', () {
      final updatedTask = task.assignTo(user);
      expect(updatedTask.assignedTo, user);
    });

    test('copyWithName should create a new Task with the updated name', () {
      final updatedTask = task.copyWithName('Updated Task Name');
      expect(updatedTask.name, 'Updated Task Name');
    });

    test(
        'copyWithEstimation should create a new Task with the updated estimation',
        () {
      final updatedTask = task.copyWithEstimation(EstimationChoices.two);
      expect(updatedTask.estimation, EstimationChoices.two);
    });

    test('copyWithStatus should create a new Task with the updated status', () {
      final updatedTask = task.copyWithStatus(TaskStatusChoices.inProgress);
      expect(updatedTask.status, TaskStatusChoices.inProgress);
    });
  });
}
