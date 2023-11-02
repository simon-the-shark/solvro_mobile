import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/enums/enums.dart';
import 'package:solvro_mobile/models/users/user.dart';

void main() {
  group('User tests', () {
    final user = User(
      id: 1,
      token: 'token123',
      email: 'user@example.com',
      profession: ProfessionChoices.frontend,
      name: 'John Doe',
    );

    test('User creation', () {
      expect(
          user,
          User(
            id: 1,
            token: 'token123',
            email: 'user@example.com',
            profession: ProfessionChoices.frontend,
            name: 'John Doe',
          ));
    });

    test('User copyWithName', () {
      final updatedUser = user.copyWithName('Jane Doe');
      expect(
          updatedUser,
          User(
            id: user.id,
            token: user.token,
            email: user.email,
            profession: user.profession,
            name: 'Jane Doe',
          ));
    });

    test('User copyWithProfession', () {
      final updatedUser = user.copyWithProfession(ProfessionChoices.uxUi);
      expect(
          updatedUser,
          User(
            id: user.id,
            token: user.token,
            email: user.email,
            profession: ProfessionChoices.uxUi,
            name: user.name,
          ));
    });

    test('User JSON serialization and deserialization', () {
      final jsonMap = user.toJson();
      final fromJsonUser = User.fromJson(jsonMap);
      expect(fromJsonUser, user);
    });
  });
}
