import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/enums.dart';
import 'package:solvro_mobile/models/project.dart';
import 'package:solvro_mobile/models/user.dart';

void main() {
  group('Project Tests', () {
    late Project project;
    late User user1;
    late User user2;

    setUp(() {
      project = Project(
        id: '1',
        name: 'Project 1',
        owner: User(
            id: 1,
            name: 'Owner',
            email: "",
            profession: ProfessionChoices.backend),
        otherUsers: [],
      );
      user1 = User(
          id: 2,
          name: 'User 1',
          email: "",
          profession: ProfessionChoices.backend);
      user2 = User(
          id: 3,
          name: 'User 2',
          email: "",
          profession: ProfessionChoices.backend);
    });

    test('copyWithName should create a new Project with the updated name', () {
      final updatedProject = project.copyWithName('New Project Name');
      expect(updatedProject.name, 'New Project Name');
      expect(updatedProject, project.copyWithName('New Project Name'));
    });

    test('aadUser should add a user to the otherUsers list', () {
      final projectWithUser1 = project.aadUser(user1);
      expect(projectWithUser1.otherUsers, contains(user1));

      final projectWithUser2 = projectWithUser1.aadUser(user2);
      expect(projectWithUser2.otherUsers, contains(user1));
      expect(projectWithUser2.otherUsers, contains(user2));
    });

    test('removeUser should remove a user from the otherUsers list', () {
      final projectWithUser1 = project.aadUser(user1);
      final projectWithoutUser1 = projectWithUser1.removeUser(user1);
      expect(projectWithoutUser1.otherUsers, isNot(contains(user1)));
    });
  });
}
