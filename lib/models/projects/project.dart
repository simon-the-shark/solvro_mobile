import 'package:freezed_annotation/freezed_annotation.dart';

import '../users/user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const Project._();

  factory Project({
    required int id,
    required String name,
    required int owner,
    @JsonKey(name: "other_users") required List<User> otherUsers,
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
      otherUsers: otherUsers.where((element) => element != user).toList(),
    );
  }
}
