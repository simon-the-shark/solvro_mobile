import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String id,
    required String name,
    required User owner,
    required List<User> otherUsers,
  }) = _Project;
}
