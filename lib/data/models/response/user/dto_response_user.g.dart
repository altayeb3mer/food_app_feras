// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_response_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoResponseUser _$DtoResponseUserFromJson(Map<String, dynamic> json) =>
    DtoResponseUser(
      dtoUser: json['user'] == null
          ? null
          : DtoUser.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DtoResponseUserToJson(DtoResponseUser instance) =>
    <String, dynamic>{
      'user': instance.dtoUser,
      'token': instance.token,
    };
