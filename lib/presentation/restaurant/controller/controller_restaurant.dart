import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_category.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:mobx/mobx.dart';

part 'controller_restaurant.g.dart';

class ControllerRestaurant = _ControllerRestaurant with _$ControllerRestaurant;

abstract class _ControllerRestaurant with Store {
  @observable
  EntityRestaurant? selectedRestaurant=EntityRestaurant();
  @observable
  EntityRestaurantCategory? selectedCategory=EntityRestaurantCategory();
  @observable
  EntityRestaurantItem? selectedItem=EntityRestaurantItem();

  @action
  void setSelectedRestaurant(EntityRestaurant entityRestaurant ){
    selectedRestaurant=entityRestaurant;
  }
  @action
  void setSelectedCategory(EntityRestaurantCategory? category ){
    selectedCategory=category;
  }
  @action
  void setSelectedItem(EntityRestaurantItem? item ){
    selectedItem=item;
  }

}
