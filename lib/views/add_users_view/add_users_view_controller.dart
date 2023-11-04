import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../go_router.dart';
import '../../models/projects/project.dart';
import '../../repositories/projects_repository.dart';

part 'add_users_view_controller.g.dart';

@riverpod
class AddUsersViewController extends _$AddUsersViewController {
  @override
  FutureOr<List<String>> build() {
    return [];
  }

  void addUserEmail(String email) {
    state = AsyncData([...state.value!, email]);
  }

  void deleteEmail(String e) {
    state =
        AsyncData(state.value!.whereNot((element) => element == e).toList());
  }

  Future<void> sendEmails(Project project) async {
    await ref
        .read(projectsRepositoryProvider)
        .addUsersToProjectsByEmails(project, state.value ?? []);
    ref.read(goRouterProvider).go("/");
  }
}
