import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/enums/enums.dart';
import '../models/users/user.dart';
import '../repositories/auth_local_repository.dart';
import '../repositories/auth_remote_repository.dart';
import '../repositories/projects_repository.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  @override
  FutureOr<User?> build() {
    return ref.watch(authLocalRepositoryProvider).retrieveUser();
  }

  Future<void> login(String email, String password) async {
    // state = const AsyncLoading();
    final user =
        await ref.read(authRemoteRepositoryProvider).login(email, password);
    await ref.read(authLocalRepositoryProvider).saveUser(user);
    state = AsyncData(user);
  }

  Future<void> register(
    String email,
    String password,
    ProfessionChoices profession, [
    String? name,
  ]) async {
    // state = const AsyncLoading();
    final user = await ref
        .read(authRemoteRepositoryProvider)
        .register(email, password, profession, name);
    await ref.read(authLocalRepositoryProvider).saveUser(user);
    state = AsyncData(user);
    await ref.read(projectsRepositoryProvider).addProject("Your first project");
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(authRemoteRepositoryProvider).logout();
    await ref.read(authLocalRepositoryProvider).deleteUser();
    state = const AsyncData(null);
  }
}
