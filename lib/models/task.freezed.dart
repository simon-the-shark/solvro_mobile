// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  Project get project => throw _privateConstructorUsedError;
  User get createdBy => throw _privateConstructorUsedError;
  User? get assignedTo => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  EstimationChoices get estimation => throw _privateConstructorUsedError;
  TaskStatusChoices get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      Project project,
      User createdBy,
      User? assignedTo,
      DateTime createdAt,
      String name,
      EstimationChoices estimation,
      TaskStatusChoices status});

  $ProjectCopyWith<$Res> get project;
  $UserCopyWith<$Res> get createdBy;
  $UserCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project = null,
    Object? createdBy = null,
    Object? assignedTo = freezed,
    Object? createdAt = null,
    Object? name = null,
    Object? estimation = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      estimation: null == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as EstimationChoices,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatusChoices,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get createdBy {
    return $UserCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Project project,
      User createdBy,
      User? assignedTo,
      DateTime createdAt,
      String name,
      EstimationChoices estimation,
      TaskStatusChoices status});

  @override
  $ProjectCopyWith<$Res> get project;
  @override
  $UserCopyWith<$Res> get createdBy;
  @override
  $UserCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? project = null,
    Object? createdBy = null,
    Object? assignedTo = freezed,
    Object? createdAt = null,
    Object? name = null,
    Object? estimation = null,
    Object? status = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      estimation: null == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as EstimationChoices,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatusChoices,
    ));
  }
}

/// @nodoc

class _$TaskImpl implements _Task {
  _$TaskImpl(
      {required this.id,
      required this.project,
      required this.createdBy,
      required this.assignedTo,
      required this.createdAt,
      required this.name,
      required this.estimation,
      required this.status});

  @override
  final String id;
  @override
  final Project project;
  @override
  final User createdBy;
  @override
  final User? assignedTo;
  @override
  final DateTime createdAt;
  @override
  final String name;
  @override
  final EstimationChoices estimation;
  @override
  final TaskStatusChoices status;

  @override
  String toString() {
    return 'Task(id: $id, project: $project, createdBy: $createdBy, assignedTo: $assignedTo, createdAt: $createdAt, name: $name, estimation: $estimation, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.estimation, estimation) ||
                other.estimation == estimation) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, project, createdBy,
      assignedTo, createdAt, name, estimation, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task implements Task {
  factory _Task(
      {required final String id,
      required final Project project,
      required final User createdBy,
      required final User? assignedTo,
      required final DateTime createdAt,
      required final String name,
      required final EstimationChoices estimation,
      required final TaskStatusChoices status}) = _$TaskImpl;

  @override
  String get id;
  @override
  Project get project;
  @override
  User get createdBy;
  @override
  User? get assignedTo;
  @override
  DateTime get createdAt;
  @override
  String get name;
  @override
  EstimationChoices get estimation;
  @override
  TaskStatusChoices get status;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
