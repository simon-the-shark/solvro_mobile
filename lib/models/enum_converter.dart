import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solvro_mobile/models/enums.dart';

part 'enum_converter.freezed.dart';
part 'enum_converter.g.dart';

@freezed
class EnumJsonConverter with _$EnumJsonConverter {
  factory EnumJsonConverter({
    required ProfessionChoices profession,
  }) = _EnumConverter;

  factory EnumJsonConverter.fromJson(Map<String, Object?> json) =>
      _$EnumJsonConverterFromJson(json);
}
