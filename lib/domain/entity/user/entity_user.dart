import 'package:food_app/data/models/response/user/dto_response_user.dart';

class EntityUser {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  int? isCompletedProfile;
  int? makeResetPassword;
  String? createdAt;
  String? updatedAt;
  String? token;

  EntityUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.isCompletedProfile,
    this.makeResetPassword,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

 factory EntityUser.from(DtoResponseUser? dto) {
    return EntityUser(
      id: dto?.dtoUser?.id,
      name: dto?.dtoUser?.name,
      email: dto?.dtoUser?.email,
      emailVerifiedAt: dto?.dtoUser?.emailVerifiedAt,
      phoneNumber: dto?.dtoUser?.phoneNumber,
      isCompletedProfile: dto?.dtoUser?.isCompletedProfile,
      makeResetPassword: dto?.dtoUser?.makeResetPassword,
      createdAt: dto?.dtoUser?.createdAt,
      updatedAt: dto?.dtoUser?.updatedAt,
      token: dto?.token,
    );
  }
}
