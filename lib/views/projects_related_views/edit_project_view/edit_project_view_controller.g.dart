// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_project_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editProjectViewControllerHash() =>
    r'7b7606a46b059b578e545e211fdb8ab37f1901fc';

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

abstract class _$EditProjectViewController
    extends BuildlessAutoDisposeAsyncNotifier<(Project?, String?)> {
  late final int projectId;

  FutureOr<(Project?, String?)> build(
    int projectId,
  );
}

/// See also [EditProjectViewController].
@ProviderFor(EditProjectViewController)
const editProjectViewControllerProvider = EditProjectViewControllerFamily();

/// See also [EditProjectViewController].
class EditProjectViewControllerFamily
    extends Family<AsyncValue<(Project?, String?)>> {
  /// See also [EditProjectViewController].
  const EditProjectViewControllerFamily();

  /// See also [EditProjectViewController].
  EditProjectViewControllerProvider call(
    int projectId,
  ) {
    return EditProjectViewControllerProvider(
      projectId,
    );
  }

  @override
  EditProjectViewControllerProvider getProviderOverride(
    covariant EditProjectViewControllerProvider provider,
  ) {
    return call(
      provider.projectId,
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
  String? get name => r'editProjectViewControllerProvider';
}

/// See also [EditProjectViewController].
class EditProjectViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EditProjectViewController,
        (Project?, String?)> {
  /// See also [EditProjectViewController].
  EditProjectViewControllerProvider(
    int projectId,
  ) : this._internal(
          () => EditProjectViewController()..projectId = projectId,
          from: editProjectViewControllerProvider,
          name: r'editProjectViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProjectViewControllerHash,
          dependencies: EditProjectViewControllerFamily._dependencies,
          allTransitiveDependencies:
              EditProjectViewControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  EditProjectViewControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  FutureOr<(Project?, String?)> runNotifierBuild(
    covariant EditProjectViewController notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(EditProjectViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditProjectViewControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EditProjectViewController,
      (Project?, String?)> createElement() {
    return _EditProjectViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditProjectViewControllerProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditProjectViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<(Project?, String?)> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _EditProjectViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EditProjectViewController,
        (Project?, String?)> with EditProjectViewControllerRef {
  _EditProjectViewControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as EditProjectViewControllerProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
