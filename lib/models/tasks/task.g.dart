// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int?,
      project: json['project'] as int,
      createdBy: json['created_by'] as int,
      assignedTo: json['assigned_to'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      estimation: $enumDecode(_$EstimationChoicesEnumMap, json['estimation']),
      status: $enumDecode(_$TaskStatusChoicesEnumMap, json['status']),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project': instance.project,
      'created_by': instance.createdBy,
      'assigned_to': instance.assignedTo,
      'created_at': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'estimation': _$EstimationChoicesEnumMap[instance.estimation]!,
      'status': _$TaskStatusChoicesEnumMap[instance.status]!,
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
