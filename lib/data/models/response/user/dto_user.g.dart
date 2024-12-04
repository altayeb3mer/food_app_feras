// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoUser _$DtoUserFromJson(Map<String, dynamic> json) => DtoUser(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isCompletedProfile: (json['is_completed_profile'] as num?)?.toInt(),
      makeResetPassword: (json['make_reset_password'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DtoUserToJson(DtoUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone_number': instance.phoneNumber,
      'is_completed_profile': instance.isCompletedProfile,
      'make_reset_password': instance.makeResetPassword,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
