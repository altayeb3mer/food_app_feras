// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_request_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRequestLogin _$DtoRequestLoginFromJson(Map<String, dynamic> json) =>
    DtoRequestLogin(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$DtoRequestLoginToJson(DtoRequestLogin instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
