import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required int id,
    required String token,
    required String email,
    ProfessionChoices? profession,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  User copyWithName(String name) {
    return copyWith(name: name);
  }

  User copyWithProfession(ProfessionChoices profession) {
    return copyWith(profession: profession);
  }
}
