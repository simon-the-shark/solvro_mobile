// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnumConverterImpl _$$EnumConverterImplFromJson(Map<String, dynamic> json) =>
    _$EnumConverterImpl(
      profession: $enumDecode(_$ProfessionChoicesEnumMap, json['profession']),
    );

Map<String, dynamic> _$$EnumConverterImplToJson(_$EnumConverterImpl instance) =>
    <String, dynamic>{
      'profession': _$ProfessionChoicesEnumMap[instance.profession]!,
    };

const _$ProfessionChoicesEnumMap = {
  ProfessionChoices.frontend: 'FRONTEND',
  ProfessionChoices.backend: 'BACKEND',
  ProfessionChoices.devOps: 'DEVOPS',
  ProfessionChoices.uxUi: 'UX/UI',
};
