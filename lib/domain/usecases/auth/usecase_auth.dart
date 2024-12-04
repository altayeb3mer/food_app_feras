import 'package:food_app/data/models/request/auth/dto_request_login.dart';
import 'package:food_app/data/models/request/auth/dto_request_register.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';
import 'package:food_app/domain/repository/auth/repository_auth.dart';

class UseCaseAuth {
  RepositoryAuth repositoryAuth;

  UseCaseAuth({required this.repositoryAuth});

  Future<EntityUser?> login(String email, String password) async {
    final request = DtoRequestLogin(
      email: email,
      password: password,
    );

    return await repositoryAuth.login(request);
  }
  Future<EntityUser?> register({required String email,required  String password,required String name}) async {
    final request = DtoRequestRegister(
      email: email,
      password: password,
      name: name
    );

    return await repositoryAuth.register(request);
  }


  Future<EntityUser?> getSavedUser() async {
    return await repositoryAuth.getSavedUser();
  }

  Future<void> saveUserData(DtoResponseUser data) async {
    await repositoryAuth.saveUser(data);
  }

  Future<void> deleteUserData() async {
    await repositoryAuth.deleteSavedUser();
  }
}
