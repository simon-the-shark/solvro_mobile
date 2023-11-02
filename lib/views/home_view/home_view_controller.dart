import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/project.dart';
import '../../repositories/projects_repository.dart';

part 'home_view_controller.g.dart';

@riverpod
class HomeViewController extends _$HomeViewController {
  final _prefs = SharedPreferences.getInstance();
  final _prefsCurrentProjectStringKey = "_currentProjectIdKey";

  @override
  FutureOr<(List<Project>, Project?)> build() async {
    final projects = await ref.watch(projectsRepositoryProvider).getProjects();
    final prefs = await _prefs;
    final currProj = projects.isNotEmpty
        ? projects.firstWhere(
            (element) =>
                prefs.getInt(_prefsCurrentProjectStringKey) == element.id,
            orElse: () => projects[0],
          )
        : null;
    return (projects, currProj);
  }

  Future<void> setCurrentProject(Project project) async {
    final prefs = await _prefs;
    prefs.setInt(_prefsCurrentProjectStringKey, project.id);
    ref.invalidateSelf();
  }
}
