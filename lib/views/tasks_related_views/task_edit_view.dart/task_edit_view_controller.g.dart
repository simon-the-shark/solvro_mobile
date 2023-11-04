// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_edit_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskEditViewControllerHash() =>
    r'70e9e3a8cbfef6141aa130209627693869a28da4';

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

abstract class _$TaskEditViewController
    extends BuildlessAutoDisposeAsyncNotifier<(List<User>, Task)> {
  late final int taskId;

  FutureOr<(List<User>, Task)> build(
    int taskId,
  );
}

/// See also [TaskEditViewController].
@ProviderFor(TaskEditViewController)
const taskEditViewControllerProvider = TaskEditViewControllerFamily();

/// See also [TaskEditViewController].
class TaskEditViewControllerFamily
    extends Family<AsyncValue<(List<User>, Task)>> {
  /// See also [TaskEditViewController].
  const TaskEditViewControllerFamily();

  /// See also [TaskEditViewController].
  TaskEditViewControllerProvider call(
    int taskId,
  ) {
    return TaskEditViewControllerProvider(
      taskId,
    );
  }

  @override
  TaskEditViewControllerProvider getProviderOverride(
    covariant TaskEditViewControllerProvider provider,
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
  String? get name => r'taskEditViewControllerProvider';
}

/// See also [TaskEditViewController].
class TaskEditViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TaskEditViewController,
        (List<User>, Task)> {
  /// See also [TaskEditViewController].
  TaskEditViewControllerProvider(
    int taskId,
  ) : this._internal(
          () => TaskEditViewController()..taskId = taskId,
          from: taskEditViewControllerProvider,
          name: r'taskEditViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskEditViewControllerHash,
          dependencies: TaskEditViewControllerFamily._dependencies,
          allTransitiveDependencies:
              TaskEditViewControllerFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TaskEditViewControllerProvider._internal(
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
  FutureOr<(List<User>, Task)> runNotifierBuild(
    covariant TaskEditViewController notifier,
  ) {
    return notifier.build(
      taskId,
    );
  }

  @override
  Override overrideWith(TaskEditViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskEditViewControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TaskEditViewController,
      (List<User>, Task)> createElement() {
    return _TaskEditViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskEditViewControllerProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskEditViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<(List<User>, Task)> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TaskEditViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TaskEditViewController,
        (List<User>, Task)> with TaskEditViewControllerRef {
  _TaskEditViewControllerProviderElement(super.provider);

  @override
  int get taskId => (origin as TaskEditViewControllerProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
