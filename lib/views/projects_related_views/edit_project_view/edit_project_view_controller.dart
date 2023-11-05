import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../go_router.dart';
import '../../../models/projects/project.dart';
import '../../../models/users/user.dart';
import '../../../repositories/projects_repository.dart';

part 'edit_project_view_controller.g.dart';

@riverpod
class EditProjectViewController extends _$EditProjectViewController {
  @override
  FutureOr<(Project?, String?)> build(int projectId) async {
    final projects = await ref.watch(projectsRepositoryProvider).getProjects();
    final project =
        projects.firstWhereOrNull((element) => element.id == projectId);
    return (project, project?.name);
  }

  Future<void> editProject() async {
    final updatedProject = state.value!.$1!;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(projectsRepositoryProvider)
          .updateProject(updatedProject)
          .then(
            (value) => ref.read(goRouterProvider).go("/"),
          )
          .then((value) => state.value!),
    );
  }

  Map<String, dynamic> formatExceptionMap() {
    if (state.error == null) return {};
    final errorList = state.error.toString().split("Exception: ");
    if (errorList.length >= 2) {
      return (jsonDecode(errorList[1]) as Map<String, dynamic>).map(
          (key, value) => (value is List)
              ? MapEntry(key, value[0] ?? "Err")
              : MapEntry(key, value));
    }
    return {"error": state.error.toString()};
  }

  void nameOnChanged(String val) {
    state = AsyncData((state.value!.$1?.copyWithName(val), state.value!.$2));
  }

  void removeUser(User user) {
    state = AsyncData((state.value!.$1?.removeUser(user), state.value!.$2));
  }
}
