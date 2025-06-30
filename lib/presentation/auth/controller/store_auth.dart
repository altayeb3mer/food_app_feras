import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/token_interceptor.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';
import 'package:food_app/domain/usecases/auth/usecase_auth.dart';
import 'package:mobx/mobx.dart';

part 'store_auth.g.dart';

class StoreAuth = _StoreAuth with _$StoreAuth;

abstract class _StoreAuth with Store {
  UseCaseAuth useCaseAuth;
  EntityUser? entityUser;

  _StoreAuth({required this.useCaseAuth}) {
    loadUserFromLocal();
  }

  @observable
  ObservableFuture<EntityUser?>? loginFuture;
  @observable
  ObservableFuture<EntityUser?>? registerFuture;

  @computed
  bool get isLoading =>
      loginFuture?.status == FutureStatus.pending ||
      registerFuture?.status == FutureStatus.pending;

  @action
  Future<void> login(String email, String password) async {
    try {
      final call = loginFun(email, password);
      loginFuture = ObservableFuture(call);
      loginFuture?.then((userEntity)async {
        if (userEntity != null && userEntity.id != null || kDebugMode==true) {
          //update token
          await  DioClient.reinitializeDioClient(userEntity?.token??'');
          //go to dashboard
          final navigatorKey = getIt<GlobalKey<NavigatorState>>();
          Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, AppRoutes.screenMain);
        } else {
          //error
          Logging.error('Error login');
        }
      });
    } catch (e) {
      Logging.error('Error login-------$e');
      AppMassager.showError(e.toString());
    }
  }

  @action
  Future<void> register(String email, String password, String name) async {
    try {
      final call = registerFun(email, password, name);
      registerFuture = ObservableFuture(call);
      registerFuture?.then((userEntity) async{
        if (userEntity != null && userEntity.id != null) {
          //update token
        await  DioClient.reinitializeDioClient(userEntity.token??'');
          //go to dashboard
          final navigatorKey = getIt<GlobalKey<NavigatorState>>();
          Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, AppRoutes.screenMain);
          AppMassager.showSuccess('Done');
        } else {
          //error
          Logging.error('register()-----register error');
        }
      });
    } catch (e) {
      Logging.error('Error register-------$e');
      AppMassager.showError(e.toString());
    }
  }

  Future<EntityUser?> loginFun(String email, String password) async {
    return useCaseAuth.login(email, password);
  }

  Future<EntityUser?> registerFun(
      String email, String password, String name) async {
    return useCaseAuth.register(name: name, email: email, password: password);
  }

  Future<void> loadUserFromLocal() async {
    final user = await useCaseAuth.getSavedUser();
    entityUser = user;
  }

  @action
  Future<EntityUser?> getSavedUser() async {
    return await useCaseAuth.getSavedUser();
  }

  @action
  Future<void> logout() async {
    final navigatorKey = getIt<GlobalKey<NavigatorState>>();
    final ctx = navigatorKey.currentContext!;
    await useCaseAuth.deleteUserData();
    Navigator.pushReplacementNamed(ctx, AppRoutes.login);
  }
}
