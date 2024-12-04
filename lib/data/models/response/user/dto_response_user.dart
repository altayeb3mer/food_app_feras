
import 'package:food_app/data/models/response/user/dto_user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dto_response_user.g.dart';
@JsonSerializable()
class DtoResponseUser{
  @JsonKey(name:'user')
  DtoUser? dtoUser;
  @JsonKey(name:'token')
  String? token;

  DtoResponseUser({this.dtoUser, this.token});
  factory DtoResponseUser.fromJson(Map<String, dynamic> json) => _$DtoResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$DtoResponseUserToJson(this);
}