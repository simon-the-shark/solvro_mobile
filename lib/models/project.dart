import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String id,
    required String name,
    required User owner,
    required List<User> otherUsers,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
