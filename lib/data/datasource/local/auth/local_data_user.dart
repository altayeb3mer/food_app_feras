import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';

abstract class LocalDataUser {
  Future<void> save(DtoResponseUser data);

  Future<EntityUser?> getUserEntity();

  Future<void> deleteUser();
}

class LocalDataUserImpl extends LocalDataUser {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final userDataKey = 'userData';

  @override
  Future<void> deleteUser() async {
    await secureStorage.delete(key: userDataKey);
  }

  @override
  Future<EntityUser?> getUserEntity() async {
    try {
      String? userJson = await secureStorage.read(key: userDataKey);
      if (userJson == null) {
        return null;
      }
      return EntityUser
          .from(DtoResponseUser.fromJson(jsonDecode(userJson)));
    } catch (e) {
      Logging.error('save user error----------$e');
    }
    return null;
  }

  @override
  Future<void> save(DtoResponseUser data) async {
    try {
      await secureStorage.write(
        key: userDataKey,
        value: jsonEncode(data.toJson()),
      );
    } on Exception catch (e) {
      Logging.error('save user error----------$e');
    }
  }
}
