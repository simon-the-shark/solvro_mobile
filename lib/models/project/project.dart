import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const Project._();

  factory Project({
    required String id,
    required String name,
    required User owner,
    required List<User> otherUsers,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);

  Project copyWithName(String name) {
    return copyWith(name: name);
  }

  Project aadUser(User user) {
    return copyWith(otherUsers: [...otherUsers, user]);
  }

  Project removeUser(User user) {
    return copyWith(
        otherUsers: otherUsers.where((element) => element != user).toList());
  }
}
