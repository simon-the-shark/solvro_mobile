import 'package:freezed_annotation/freezed_annotation.dart';

part 'enums.freezed.dart';
part 'enums.g.dart';

@JsonEnum()
enum EstimationChoices {
  @JsonValue(1)
  one,
  @JsonValue(2)
  two,
  @JsonValue(3)
  three,
  @JsonValue(5)
  five,
  @JsonValue(8)
  eight,
  @JsonValue(13)
  thirteen,
  @JsonValue(21)
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
    EstimationChoices? estimation,
  }) = _EnumConverter;

  factory EnumJsonConverter.fromJson(Map<String, Object?> json) =>
      _$EnumJsonConverterFromJson(json);

  static String? valueString<T extends Enum>(T? val) {
    if (val is ProfessionChoices) {
      return EnumJsonConverter(profession: val).toJson()["profession"];
    } else if (val is EstimationChoices) {
      return val
          .toString()
          .toUpperCase()
          .split("ESTIMATIONCHOICES.")[1]
          .replaceFirst("TWENTYONE", "TWENTY_ONE");
    }
    return null;
  }
}
