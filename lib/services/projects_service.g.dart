// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectsServiceHash() => r'62f5edc2a1c062420d7cb75ac4f4d87497761b60';

/// See also [ProjectsService].
@ProviderFor(ProjectsService)
final projectsServiceProvider =
    AutoDisposeAsyncNotifierProvider<ProjectsService, List<Project>>.internal(
  ProjectsService.new,
  name: r'projectsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectsService = AutoDisposeAsyncNotifier<List<Project>>;
String _$currentProjectSubServiceHash() =>
    r'18ec03471259c3ff96a1d414ae8a9ddbcb605292';

/// See also [CurrentProjectSubService].
@ProviderFor(CurrentProjectSubService)
final currentProjectSubServiceProvider = AutoDisposeAsyncNotifierProvider<
    CurrentProjectSubService, Project?>.internal(
  CurrentProjectSubService.new,
  name: r'currentProjectSubServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProjectSubServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentProjectSubService = AutoDisposeAsyncNotifier<Project?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
