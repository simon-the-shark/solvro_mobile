// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      otherUsers: (json['other_users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'other_users': instance.otherUsers,
    };
