// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerCart on _ControllerCart, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ControllerCart.isLoading'))
          .value;

  late final _$cartListAtom =
      Atom(name: '_ControllerCart.cartList', context: context);

  @override
  ObservableList<EntityRestaurantItem> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableList<EntityRestaurantItem> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$getCartFutureAtom =
      Atom(name: '_ControllerCart.getCartFuture', context: context);

  @override
  ObservableFuture<List<EntityRestaurantItem>?>? get getCartFuture {
    _$getCartFutureAtom.reportRead();
    return super.getCartFuture;
  }

  @override
  set getCartFuture(ObservableFuture<List<EntityRestaurantItem>?>? value) {
    _$getCartFutureAtom.reportWrite(value, super.getCartFuture, () {
      super.getCartFuture = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ControllerCart.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addToCartAsyncAction =
      AsyncAction('_ControllerCart.addToCart', context: context);

  @override
  Future<void> addToCart(EntityRestaurantItem item) {
    return _$addToCartAsyncAction.run(() => super.addToCart(item));
  }

  late final _$removeFromCartAsyncAction =
      AsyncAction('_ControllerCart.removeFromCart', context: context);

  @override
  Future<void> removeFromCart(EntityRestaurantItem item) {
    return _$removeFromCartAsyncAction.run(() => super.removeFromCart(item));
  }

  @override
  String toString() {
    return '''
cartList: ${cartList},
getCartFuture: ${getCartFuture},
isLoading: ${isLoading}
    ''';
  }
}
