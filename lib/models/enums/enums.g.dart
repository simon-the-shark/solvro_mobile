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
      taskStatus:
          $enumDecodeNullable(_$TaskStatusChoicesEnumMap, json['taskStatus']),
    );

Map<String, dynamic> _$$EnumConverterImplToJson(_$EnumConverterImpl instance) =>
    <String, dynamic>{
      'profession': _$ProfessionChoicesEnumMap[instance.profession],
      'estimation': _$EstimationChoicesEnumMap[instance.estimation],
      'taskStatus': _$TaskStatusChoicesEnumMap[instance.taskStatus],
    };

const _$ProfessionChoicesEnumMap = {
  ProfessionChoices.frontend: 'FRONTEND',
  ProfessionChoices.backend: 'BACKEND',
  ProfessionChoices.devops: 'DEVOPS',
  ProfessionChoices.uxUi: 'UX/UI',
  ProfessionChoices.none: '',
};

const _$EstimationChoicesEnumMap = {
  EstimationChoices.one: 1,
  EstimationChoices.two: 2,
  EstimationChoices.three: 3,
  EstimationChoices.five: 5,
  EstimationChoices.eight: 8,
  EstimationChoices.thirteen: 13,
  EstimationChoices.twentyOne: 21,
};

const _$TaskStatusChoicesEnumMap = {
  TaskStatusChoices.notAssigned: 'NOT_ASSIGNED',
  TaskStatusChoices.inProgress: 'IN_PROGRESS',
  TaskStatusChoices.closed: 'CLOSED',
};
