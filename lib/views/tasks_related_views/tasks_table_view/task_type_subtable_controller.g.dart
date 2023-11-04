// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_subtable_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskTypeSubtableControllerHash() =>
    r'8f6408a03fdde8d10b8c2d71ae00d2ad77cf3f66';

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

abstract class _$TaskTypeSubtableController
    extends BuildlessAutoDisposeAsyncNotifier<List<Task>?> {
  late final TaskStatusChoices statusChoice;

  FutureOr<List<Task>?> build(
    TaskStatusChoices statusChoice,
  );
}

/// See also [TaskTypeSubtableController].
@ProviderFor(TaskTypeSubtableController)
const taskTypeSubtableControllerProvider = TaskTypeSubtableControllerFamily();

/// See also [TaskTypeSubtableController].
class TaskTypeSubtableControllerFamily extends Family<AsyncValue<List<Task>?>> {
  /// See also [TaskTypeSubtableController].
  const TaskTypeSubtableControllerFamily();

  /// See also [TaskTypeSubtableController].
  TaskTypeSubtableControllerProvider call(
    TaskStatusChoices statusChoice,
  ) {
    return TaskTypeSubtableControllerProvider(
      statusChoice,
    );
  }

  @override
  TaskTypeSubtableControllerProvider getProviderOverride(
    covariant TaskTypeSubtableControllerProvider provider,
  ) {
    return call(
      provider.statusChoice,
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
  String? get name => r'taskTypeSubtableControllerProvider';
}

/// See also [TaskTypeSubtableController].
class TaskTypeSubtableControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TaskTypeSubtableController,
        List<Task>?> {
  /// See also [TaskTypeSubtableController].
  TaskTypeSubtableControllerProvider(
    TaskStatusChoices statusChoice,
  ) : this._internal(
          () => TaskTypeSubtableController()..statusChoice = statusChoice,
          from: taskTypeSubtableControllerProvider,
          name: r'taskTypeSubtableControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskTypeSubtableControllerHash,
          dependencies: TaskTypeSubtableControllerFamily._dependencies,
          allTransitiveDependencies:
              TaskTypeSubtableControllerFamily._allTransitiveDependencies,
          statusChoice: statusChoice,
        );

  TaskTypeSubtableControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.statusChoice,
  }) : super.internal();

  final TaskStatusChoices statusChoice;

  @override
  FutureOr<List<Task>?> runNotifierBuild(
    covariant TaskTypeSubtableController notifier,
  ) {
    return notifier.build(
      statusChoice,
    );
  }

  @override
  Override overrideWith(TaskTypeSubtableController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskTypeSubtableControllerProvider._internal(
        () => create()..statusChoice = statusChoice,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        statusChoice: statusChoice,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TaskTypeSubtableController,
      List<Task>?> createElement() {
    return _TaskTypeSubtableControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskTypeSubtableControllerProvider &&
        other.statusChoice == statusChoice;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, statusChoice.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskTypeSubtableControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Task>?> {
  /// The parameter `statusChoice` of this provider.
  TaskStatusChoices get statusChoice;
}

class _TaskTypeSubtableControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TaskTypeSubtableController,
        List<Task>?> with TaskTypeSubtableControllerRef {
  _TaskTypeSubtableControllerProviderElement(super.provider);

  @override
  TaskStatusChoices get statusChoice =>
      (origin as TaskTypeSubtableControllerProvider).statusChoice;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
