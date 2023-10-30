import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required String email,
    required ProfessionChoices profession,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
