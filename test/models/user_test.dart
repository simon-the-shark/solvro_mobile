import 'package:flutter_test/flutter_test.dart';
import 'package:solvro_mobile/models/enums.dart';
import 'package:solvro_mobile/models/user.dart';

void main() {
  group('User Tests', () {
    late User user;

    setUp(() {
      // Initialize a User instance before each test.
      user = User(
          id: 1,
          email: 'user@test.com',
          profession: ProfessionChoices.frontend,
          name: 'Jan Kowalski');
    });

    test('copyWithName should create a new User with the updated name', () {
      final updatedUser = user.copyWithName('Janina Kowalska');
      expect(updatedUser.name, 'Janina Kowalska');
      expect(updatedUser, user.copyWithName('Janina Kowalska'));
    });

    test(
        'copyWithProfession should create a new User with the updated profession',
        () {
      final updatedUser = user.copyWithProfession(ProfessionChoices.backend);
      expect(updatedUser.profession, ProfessionChoices.backend);
      expect(updatedUser, user.copyWithProfession(ProfessionChoices.backend));
    });
  });
}
