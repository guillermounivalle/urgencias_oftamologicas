// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffAuthorization _$StaffAuthorizationFromJson(Map<String, dynamic> json) =>
    StaffAuthorization(
      json['documentId'] as String,
      json['email'] as String,
      json['isactive'] as bool,
      json['isadministrator'] as bool,
      json['lastname'] as String,
      json['name'] as String,
      json['speciality'] as String,
    );

Map<String, dynamic> _$StaffAuthorizationToJson(StaffAuthorization instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'email': instance.email,
      'isactive': instance.isactive,
      'isadministrator': instance.isadministrator,
      'lastname': instance.lastname,
      'name': instance.name,
      'speciality': instance.speciality,
    };
