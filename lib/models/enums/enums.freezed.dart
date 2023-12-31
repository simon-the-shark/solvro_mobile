// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enums.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnumJsonConverter _$EnumJsonConverterFromJson(Map<String, dynamic> json) {
  return _EnumConverter.fromJson(json);
}

/// @nodoc
mixin _$EnumJsonConverter {
  ProfessionChoices? get profession => throw _privateConstructorUsedError;
  EstimationChoices? get estimation => throw _privateConstructorUsedError;
  TaskStatusChoices? get taskStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnumJsonConverterCopyWith<EnumJsonConverter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnumJsonConverterCopyWith<$Res> {
  factory $EnumJsonConverterCopyWith(
          EnumJsonConverter value, $Res Function(EnumJsonConverter) then) =
      _$EnumJsonConverterCopyWithImpl<$Res, EnumJsonConverter>;
  @useResult
  $Res call(
      {ProfessionChoices? profession,
      EstimationChoices? estimation,
      TaskStatusChoices? taskStatus});
}

/// @nodoc
class _$EnumJsonConverterCopyWithImpl<$Res, $Val extends EnumJsonConverter>
    implements $EnumJsonConverterCopyWith<$Res> {
  _$EnumJsonConverterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profession = freezed,
    Object? estimation = freezed,
    Object? taskStatus = freezed,
  }) {
    return _then(_value.copyWith(
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as ProfessionChoices?,
      estimation: freezed == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as EstimationChoices?,
      taskStatus: freezed == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatusChoices?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnumConverterImplCopyWith<$Res>
    implements $EnumJsonConverterCopyWith<$Res> {
  factory _$$EnumConverterImplCopyWith(
          _$EnumConverterImpl value, $Res Function(_$EnumConverterImpl) then) =
      __$$EnumConverterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfessionChoices? profession,
      EstimationChoices? estimation,
      TaskStatusChoices? taskStatus});
}

/// @nodoc
class __$$EnumConverterImplCopyWithImpl<$Res>
    extends _$EnumJsonConverterCopyWithImpl<$Res, _$EnumConverterImpl>
    implements _$$EnumConverterImplCopyWith<$Res> {
  __$$EnumConverterImplCopyWithImpl(
      _$EnumConverterImpl _value, $Res Function(_$EnumConverterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profession = freezed,
    Object? estimation = freezed,
    Object? taskStatus = freezed,
  }) {
    return _then(_$EnumConverterImpl(
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as ProfessionChoices?,
      estimation: freezed == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as EstimationChoices?,
      taskStatus: freezed == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatusChoices?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnumConverterImpl implements _EnumConverter {
  _$EnumConverterImpl({this.profession, this.estimation, this.taskStatus});

  factory _$EnumConverterImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnumConverterImplFromJson(json);

  @override
  final ProfessionChoices? profession;
  @override
  final EstimationChoices? estimation;
  @override
  final TaskStatusChoices? taskStatus;

  @override
  String toString() {
    return 'EnumJsonConverter(profession: $profession, estimation: $estimation, taskStatus: $taskStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnumConverterImpl &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.estimation, estimation) ||
                other.estimation == estimation) &&
            (identical(other.taskStatus, taskStatus) ||
                other.taskStatus == taskStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, profession, estimation, taskStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnumConverterImplCopyWith<_$EnumConverterImpl> get copyWith =>
      __$$EnumConverterImplCopyWithImpl<_$EnumConverterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnumConverterImplToJson(
      this,
    );
  }
}

abstract class _EnumConverter implements EnumJsonConverter {
  factory _EnumConverter(
      {final ProfessionChoices? profession,
      final EstimationChoices? estimation,
      final TaskStatusChoices? taskStatus}) = _$EnumConverterImpl;

  factory _EnumConverter.fromJson(Map<String, dynamic> json) =
      _$EnumConverterImpl.fromJson;

  @override
  ProfessionChoices? get profession;
  @override
  EstimationChoices? get estimation;
  @override
  TaskStatusChoices? get taskStatus;
  @override
  @JsonKey(ignore: true)
  _$$EnumConverterImplCopyWith<_$EnumConverterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
