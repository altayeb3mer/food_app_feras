

import 'package:food_app/data/models/request/auth/dto_request_login.dart';
import 'package:food_app/data/models/request/auth/dto_request_register.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';

abstract class RepositoryAuth{
  //login
  Future<EntityUser?> login(DtoRequestLogin request);
  Future<EntityUser?> getSavedUser();
  Future<void> saveUser(DtoResponseUser data);
  Future<void> deleteSavedUser();
  //register
  Future<EntityUser?> register(DtoRequestRegister request);



}