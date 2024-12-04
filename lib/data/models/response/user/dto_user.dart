
import 'package:json_annotation/json_annotation.dart';
part 'dto_user.g.dart';
@JsonSerializable()
class DtoUser{
  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'name')
  String? name;
  @JsonKey(name:'email')
  String? email;
  @JsonKey(name:'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name:'phone_number')
  String? phoneNumber;
  @JsonKey(name:'is_completed_profile')
  int? isCompletedProfile;
  @JsonKey(name:'make_reset_password')
  int? makeResetPassword;
  @JsonKey(name:'created_at')
  String? createdAt;
  @JsonKey(name:'updated_at')
  String? updatedAt;

  DtoUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.isCompletedProfile,
    this.makeResetPassword,
    this.createdAt,
    this.updatedAt
  });
  factory DtoUser.fromJson(Map<String, dynamic> json) => _$DtoUserFromJson(json);

  Map<String, dynamic> toJson() => _$DtoUserToJson(this);
}