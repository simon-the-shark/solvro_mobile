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
  devops,
  @JsonValue("UX/UI")
  uxUi,
  @JsonValue("")
  none,
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
    ProfessionChoices? profession,
  }) = _EnumConverter;

  factory EnumJsonConverter.fromJson(Map<String, Object?> json) =>
      _$EnumJsonConverterFromJson(json);

  static String? valueString<T extends Enum>(T? val) {
    if (val is ProfessionChoices) {
      return EnumJsonConverter(profession: val).toJson()["profession"];
    }
    return null;
  }
}
