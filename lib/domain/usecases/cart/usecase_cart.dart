import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/domain/repository/cart/repository_cart.dart';

class UseCaseCart {
  RepositoryCart repositoryCart;

  UseCaseCart({required this.repositoryCart});

  Future<void> save(EntityRestaurantItem item) async {
    await repositoryCart.save(item);
  }

  Future<List<EntityRestaurantItem>?> getCartData() async {
    return repositoryCart.getCartData();
  }

  Future<void> deleteItem(EntityRestaurantItem item) async {
    await repositoryCart.deleteItem(item);
  }

  Future<void> clearCart() async {
    await repositoryCart.clearCart();
  }
}
