// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnumConverterImpl _$$EnumConverterImplFromJson(Map<String, dynamic> json) =>
    _$EnumConverterImpl(
      profession:
          $enumDecodeNullable(_$ProfessionChoicesEnumMap, json['profession']),
      estimation:
          $enumDecodeNullable(_$EstimationChoicesEnumMap, json['estimation']),
    );

Map<String, dynamic> _$$EnumConverterImplToJson(_$EnumConverterImpl instance) =>
    <String, dynamic>{
      'profession': _$ProfessionChoicesEnumMap[instance.profession],
      'estimation': _$EstimationChoicesEnumMap[instance.estimation],
    };

const _$ProfessionChoicesEnumMap = {
  ProfessionChoices.frontend: 'FRONTEND',
  ProfessionChoices.backend: 'BACKEND',
  ProfessionChoices.devops: 'DEVOPS',
  ProfessionChoices.uxUi: 'UX/UI',
  ProfessionChoices.none: '',
};

const _$EstimationChoicesEnumMap = {
  EstimationChoices.one: 'ONE',
  EstimationChoices.two: 'TWO',
  EstimationChoices.three: 'THREE',
  EstimationChoices.five: 'FIVE',
  EstimationChoices.eight: 'EIGHT',
  EstimationChoices.thirteen: 'THIRTEEN',
  EstimationChoices.twentyOne: 'TWENTY_ONE',
};
