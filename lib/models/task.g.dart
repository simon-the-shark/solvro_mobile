// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      assignedTo: json['assignedTo'] == null
          ? null
          : User.fromJson(json['assignedTo'] as Map<String, dynamic>),
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
  EstimationChoices.one: 'one',
  EstimationChoices.two: 'two',
  EstimationChoices.three: 'three',
  EstimationChoices.five: 'five',
  EstimationChoices.eight: 'eight',
  EstimationChoices.thirteen: 'thirteen',
  EstimationChoices.twentyOne: 'twentyOne',
};

const _$TaskStatusChoicesEnumMap = {
  TaskStatusChoices.notAssigned: 'notAssigned',
  TaskStatusChoices.inProgress: 'inProgress',
  TaskStatusChoices.closed: 'closed',
};
