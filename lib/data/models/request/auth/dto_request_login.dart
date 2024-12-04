
import 'package:json_annotation/json_annotation.dart';
part 'dto_request_login.g.dart';
@JsonSerializable()
class DtoRequestLogin{
  @JsonKey(name:'email')
  String? email;
  @JsonKey(name:'password')
  String? password;

  DtoRequestLogin({this.email, this.password});

  factory DtoRequestLogin.fromJson(Map<String, dynamic> json) => _$DtoRequestLoginFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRequestLoginToJson(this);
}