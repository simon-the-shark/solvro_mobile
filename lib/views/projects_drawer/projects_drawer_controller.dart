import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solvro_mobile/repositories/current_project_local_repository.dart';

import '../../models/projects/project.dart';
import '../../repositories/projects_repository.dart';

part 'projects_drawer_controller.g.dart';

@riverpod
class ProjectsDrawerController extends _$ProjectsDrawerController {
  @override
  FutureOr<List<Project>> build() async {
    return await ref.watch(projectsRepositoryProvider).getProjects();
  }
}

@riverpod
class CurrentProjectSubcontroller extends _$CurrentProjectSubcontroller {
  @override
  FutureOr<Project?> build() async {
    final projects = ref.watch(projectsDrawerControllerProvider).value;
    if (projects?.isEmpty != false) {
      return null;
    }
    final currId = await ref
        .watch(currentProjectLocalRepositoryProvider)
        .getCurrentProjectId();
    return projects!.firstWhere(
      (element) => currId == element.id,
      orElse: () => projects[0],
    );
  }

  Future<void> setCurrentProject(Project project) async {
    await ref
        .read(currentProjectLocalRepositoryProvider)
        .setCurrentProject(project);
    ref.invalidateSelf();
  }
}
