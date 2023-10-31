// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      profession:
          $enumDecodeNullable(_$ProfessionChoicesEnumMap, json['profession']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profession': _$ProfessionChoicesEnumMap[instance.profession],
      'name': instance.name,
    };

const _$ProfessionChoicesEnumMap = {
  ProfessionChoices.frontend: 'FRONTEND',
  ProfessionChoices.backend: 'BACKEND',
  ProfessionChoices.devOps: 'DEVOPS',
  ProfessionChoices.uxUi: 'UX/UI',
};
