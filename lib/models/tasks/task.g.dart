// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      project: json['project'] as int,
      createdBy: json['createdBy'] as int,
      assignedTo: json['assignedTo'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      estimation: $enumDecode(_$EstimationChoicesEnumMap, json['estimation']),
      status: $enumDecode(_$TaskStatusChoicesEnumMap, json['status']),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project': instance.project,
      'createdBy': instance.createdBy,
      'assignedTo': instance.assignedTo,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'estimation': _$EstimationChoicesEnumMap[instance.estimation]!,
      'status': _$TaskStatusChoicesEnumMap[instance.status]!,
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

const _$TaskStatusChoicesEnumMap = {
  TaskStatusChoices.notAssigned: 'NOT_ASSIGNED',
  TaskStatusChoices.inProgress: 'IN_PROGRESS',
  TaskStatusChoices.closed: 'CLOSED',
};
