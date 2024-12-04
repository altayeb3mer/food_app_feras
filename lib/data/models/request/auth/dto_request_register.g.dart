// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_request_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRequestRegister _$DtoRequestRegisterFromJson(Map<String, dynamic> json) =>
    DtoRequestRegister(
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DtoRequestRegisterToJson(DtoRequestRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
    };
