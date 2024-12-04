import 'package:json_annotation/json_annotation.dart';
part 'dto_request_register.g.dart';
@JsonSerializable()

class DtoRequestRegister{
  @JsonKey(name:'email')
  String? email;
  @JsonKey(name:'password')
  String? password;
  @JsonKey(name:'name')
  String? name;

  DtoRequestRegister({this.email, this.password,this.name});

  factory DtoRequestRegister.fromJson(Map<String, dynamic> json) => _$DtoRequestRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRequestRegisterToJson(this);
}