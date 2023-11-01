import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/project.dart';

void main() {
  group('Project tests', () {
    final project = Project(
      id: 1,
      name: 'Project 1',
      owner: 2,
      otherUsers: [3, 4, 5],
    );

    test('Project creation', () {
      expect(
          project,
          Project(
            id: 1,
            name: 'Project 1',
            owner: 2,
            otherUsers: [3, 4, 5],
          ));
    });

    test('Project copyWithName', () {
      final updatedProject = project.copyWithName('Updated Project');
      expect(
          updatedProject,
          Project(
            id: project.id,
            name: 'Updated Project',
            owner: project.owner,
            otherUsers: project.otherUsers,
          ));
    });

    test('Project aadUser', () {
      final updatedProject = project.aadUser(6);
      expect(
          updatedProject,
          Project(
            id: project.id,
            name: project.name,
            owner: project.owner,
            otherUsers: [3, 4, 5, 6],
          ));
    });

    test('Project removeUser', () {
      final updatedProject = project.removeUser(4);
      expect(
          updatedProject,
          Project(
            id: project.id,
            name: project.name,
            owner: project.owner,
            otherUsers: [3, 5],
          ));
    });

    test('Project JSON serialization and deserialization', () {
      final jsonMap = project.toJson();
      final fromJsonProject = Project.fromJson(jsonMap);

      expect(fromJsonProject, project);
    });
  });
}
