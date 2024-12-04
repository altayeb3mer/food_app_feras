// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_dashboard.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerDashboard on _ControllerDashboard, Store {
  Computed<bool>? _$isLoadingRestaurantComputed;

  @override
  bool get isLoadingRestaurant => (_$isLoadingRestaurantComputed ??=
          Computed<bool>(() => super.isLoadingRestaurant,
              name: '_ControllerDashboard.isLoadingRestaurant'))
      .value;

  late final _$listRestaurantAtom =
      Atom(name: '_ControllerDashboard.listRestaurant', context: context);

  @override
  ObservableList<EntityRestaurant> get listRestaurant {
    _$listRestaurantAtom.reportRead();
    return super.listRestaurant;
  }

  @override
  set listRestaurant(ObservableList<EntityRestaurant> value) {
    _$listRestaurantAtom.reportWrite(value, super.listRestaurant, () {
      super.listRestaurant = value;
    });
  }

  late final _$getRestaurantFutureAtom =
      Atom(name: '_ControllerDashboard.getRestaurantFuture', context: context);

  @override
  ObservableFuture<List<EntityRestaurant>>? get getRestaurantFuture {
    _$getRestaurantFutureAtom.reportRead();
    return super.getRestaurantFuture;
  }

  @override
  set getRestaurantFuture(ObservableFuture<List<EntityRestaurant>>? value) {
    _$getRestaurantFutureAtom.reportWrite(value, super.getRestaurantFuture, () {
      super.getRestaurantFuture = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ControllerDashboard.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
listRestaurant: ${listRestaurant},
getRestaurantFuture: ${getRestaurantFuture},
isLoadingRestaurant: ${isLoadingRestaurant}
    ''';
  }
}
