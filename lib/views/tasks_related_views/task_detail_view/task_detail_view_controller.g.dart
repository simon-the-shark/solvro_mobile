// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskDetailViewControllerHash() =>
    r'f8938d5e876ad158795196cc3f61b7cdb86c3e88';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TaskDetailViewController
    extends BuildlessAutoDisposeAsyncNotifier<(Task?, User?, User?)> {
  late final int taskId;

  FutureOr<(Task?, User?, User?)> build(
    int taskId,
  );
}

/// See also [TaskDetailViewController].
@ProviderFor(TaskDetailViewController)
const taskDetailViewControllerProvider = TaskDetailViewControllerFamily();

/// See also [TaskDetailViewController].
class TaskDetailViewControllerFamily
    extends Family<AsyncValue<(Task?, User?, User?)>> {
  /// See also [TaskDetailViewController].
  const TaskDetailViewControllerFamily();

  /// See also [TaskDetailViewController].
  TaskDetailViewControllerProvider call(
    int taskId,
  ) {
    return TaskDetailViewControllerProvider(
      taskId,
    );
  }

  @override
  TaskDetailViewControllerProvider getProviderOverride(
    covariant TaskDetailViewControllerProvider provider,
  ) {
    return call(
      provider.taskId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskDetailViewControllerProvider';
}

/// See also [TaskDetailViewController].
class TaskDetailViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TaskDetailViewController,
        (Task?, User?, User?)> {
  /// See also [TaskDetailViewController].
  TaskDetailViewControllerProvider(
    int taskId,
  ) : this._internal(
          () => TaskDetailViewController()..taskId = taskId,
          from: taskDetailViewControllerProvider,
          name: r'taskDetailViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskDetailViewControllerHash,
          dependencies: TaskDetailViewControllerFamily._dependencies,
          allTransitiveDependencies:
              TaskDetailViewControllerFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TaskDetailViewControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  FutureOr<(Task?, User?, User?)> runNotifierBuild(
    covariant TaskDetailViewController notifier,
  ) {
    return notifier.build(
      taskId,
    );
  }

  @override
  Override overrideWith(TaskDetailViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskDetailViewControllerProvider._internal(
        () => create()..taskId = taskId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TaskDetailViewController,
      (Task?, User?, User?)> createElement() {
    return _TaskDetailViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskDetailViewControllerProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskDetailViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<(Task?, User?, User?)> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TaskDetailViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TaskDetailViewController,
        (Task?, User?, User?)> with TaskDetailViewControllerRef {
  _TaskDetailViewControllerProviderElement(super.provider);

  @override
  int get taskId => (origin as TaskDetailViewControllerProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
