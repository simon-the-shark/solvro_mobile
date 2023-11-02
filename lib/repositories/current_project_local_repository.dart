import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solvro_mobile/models/project.dart';

final currentProjectLocalRepositoryProvider =
    Provider<CurrentProjectLocalRepository>((ref) {
  return CurrentProjectLocalRepository();
});

class CurrentProjectLocalRepository {
  final _prefs = SharedPreferences.getInstance();
  final _prefsCurrentProjectStringKey = "_currentProjectIdKey";

  Future<void> setCurrentProject(Project project) async {
    final prefs = await _prefs;
    prefs.setInt(_prefsCurrentProjectStringKey, project.id);
  }

  Future<int?> getCurrentProjectId() async {
    final prefs = await _prefs;
    return prefs.getInt(_prefsCurrentProjectStringKey);
  }
}
