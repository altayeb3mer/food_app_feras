// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_restaurant.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerRestaurant on _ControllerRestaurant, Store {
  late final _$selectedRestaurantAtom =
      Atom(name: '_ControllerRestaurant.selectedRestaurant', context: context);

  @override
  EntityRestaurant? get selectedRestaurant {
    _$selectedRestaurantAtom.reportRead();
    return super.selectedRestaurant;
  }

  @override
  set selectedRestaurant(EntityRestaurant? value) {
    _$selectedRestaurantAtom.reportWrite(value, super.selectedRestaurant, () {
      super.selectedRestaurant = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_ControllerRestaurant.selectedCategory', context: context);

  @override
  EntityRestaurantCategory? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(EntityRestaurantCategory? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedItemAtom =
      Atom(name: '_ControllerRestaurant.selectedItem', context: context);

  @override
  EntityRestaurantItem? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(EntityRestaurantItem? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  late final _$_ControllerRestaurantActionController =
      ActionController(name: '_ControllerRestaurant', context: context);

  @override
  void setSelectedRestaurant(EntityRestaurant entityRestaurant) {
    final _$actionInfo = _$_ControllerRestaurantActionController.startAction(
        name: '_ControllerRestaurant.setSelectedRestaurant');
    try {
      return super.setSelectedRestaurant(entityRestaurant);
    } finally {
      _$_ControllerRestaurantActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(EntityRestaurantCategory? category) {
    final _$actionInfo = _$_ControllerRestaurantActionController.startAction(
        name: '_ControllerRestaurant.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_ControllerRestaurantActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedItem(EntityRestaurantItem? item) {
    final _$actionInfo = _$_ControllerRestaurantActionController.startAction(
        name: '_ControllerRestaurant.setSelectedItem');
    try {
      return super.setSelectedItem(item);
    } finally {
      _$_ControllerRestaurantActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedRestaurant: ${selectedRestaurant},
selectedCategory: ${selectedCategory},
selectedItem: ${selectedItem}
    ''';
  }
}
