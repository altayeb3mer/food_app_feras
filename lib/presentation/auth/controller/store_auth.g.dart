// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreAuth on _StoreAuth, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_StoreAuth.isLoading'))
      .value;

  late final _$loginFutureAtom =
      Atom(name: '_StoreAuth.loginFuture', context: context);

  @override
  ObservableFuture<EntityUser?>? get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<EntityUser?>? value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$registerFutureAtom =
      Atom(name: '_StoreAuth.registerFuture', context: context);

  @override
  ObservableFuture<EntityUser?>? get registerFuture {
    _$registerFutureAtom.reportRead();
    return super.registerFuture;
  }

  @override
  set registerFuture(ObservableFuture<EntityUser?>? value) {
    _$registerFutureAtom.reportWrite(value, super.registerFuture, () {
      super.registerFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_StoreAuth.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_StoreAuth.register', context: context);

  @override
  Future<void> register(String email, String password, String name) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, name));
  }

  late final _$getSavedUserAsyncAction =
      AsyncAction('_StoreAuth.getSavedUser', context: context);

  @override
  Future<EntityUser?> getSavedUser() {
    return _$getSavedUserAsyncAction.run(() => super.getSavedUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_StoreAuth.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
loginFuture: ${loginFuture},
registerFuture: ${registerFuture},
isLoading: ${isLoading}
    ''';
  }
}
