import 'package:freezed_annotation/freezed_annotation.dart';

part 'enums.freezed.dart';
part 'enums.g.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum EstimationChoices {
  one,
  two,
  three,
  five,
  eight,
  thirteen,
  twentyOne,
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum ProfessionChoices {
  frontend,
  backend,
  @JsonValue("DEVOPS")
  devOps,
  @JsonValue("UX/UI")
  uxUi,
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum TaskStatusChoices {
  notAssigned,
  inProgress,
  closed,
}

@freezed
class EnumJsonConverter with _$EnumJsonConverter {
  factory EnumJsonConverter({
    required ProfessionChoices profession,
  }) = _EnumConverter;

  factory EnumJsonConverter.fromJson(Map<String, Object?> json) =>
      _$EnumJsonConverterFromJson(json);
}
