import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/projects/project.dart';
import '../repositories/current_project_local_repository.dart';
import '../repositories/projects_repository.dart';

part 'projects_service.g.dart';

@riverpod
class ProjectsService extends _$ProjectsService {
  @override
  FutureOr<List<Project>> build() async {
    return await ref.watch(projectsRepositoryProvider).getProjects();
  }
}

@riverpod
class CurrentProjectSubService extends _$CurrentProjectSubService {
  @override
  FutureOr<Project?> build() async {
    final projects = ref.watch(projectsServiceProvider).value;
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
