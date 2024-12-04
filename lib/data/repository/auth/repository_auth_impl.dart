import 'package:food_app/data/datasource/local/auth/local_data_user.dart';
import 'package:food_app/data/datasource/network/service/auth/service_login.dart';
import 'package:food_app/data/datasource/network/service/auth/service_register.dart';
import 'package:food_app/data/models/request/auth/dto_request_login.dart';
import 'package:food_app/data/models/request/auth/dto_request_register.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';
import 'package:food_app/domain/repository/auth/repository_auth.dart';

class RepositoryAuthImpl extends RepositoryAuth {
  ServiceLogin serviceLogin;
  LocalDataUser localDataUser;
  ServiceRegister serviceRegister;

  RepositoryAuthImpl(
      {required this.serviceLogin,
      required this.localDataUser,
      required this.serviceRegister});

  @override
  Future<EntityUser?> login(DtoRequestLogin request) async {
    try {
      final data = await serviceLogin.login(request);
      if (data != null) {
        await localDataUser.save(data);
      }
      // final user = EntityUser.from(data);
      // return user;
      return await getSavedUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteSavedUser() async {
    await localDataUser.deleteUser();
  }

  @override
  Future<EntityUser?> getSavedUser() async {
    return await localDataUser.getUserEntity();
  }

  @override
  Future<void> saveUser(DtoResponseUser data) async {
    await localDataUser.save(data);
  }

  @override
  Future<EntityUser?> register(DtoRequestRegister request)async {
    try {
      final data = await serviceRegister.register(request);
      if (data != null) {
        await localDataUser.save(data);
      }
      final user = EntityUser.from(data);
      return user;
    } catch (e) {

      rethrow;
    }
  }
}
