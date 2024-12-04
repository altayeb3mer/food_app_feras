import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';

abstract class RepositoryCart{
  Future<void> save(EntityRestaurantItem item);

  Future<List<EntityRestaurantItem>?> getCartData();

  Future<void> deleteItem(EntityRestaurantItem item);

  Future<void> clearCart();
}