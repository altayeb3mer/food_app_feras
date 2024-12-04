import 'package:food_app/data/datasource/local/cart/local_data_cart.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/domain/repository/cart/repository_cart.dart';

class RepositoryCartImpl extends RepositoryCart{
  LocalDataCart localDataCart;

  RepositoryCartImpl({required this.localDataCart});

  @override
  Future<void> clearCart()async {
    await localDataCart.clearCart();
  }

  @override
  Future<void> deleteItem(EntityRestaurantItem item) async{
    await localDataCart.deleteItem(item);
  }

  @override
  Future<List<EntityRestaurantItem>?> getCartData() async{
  return  localDataCart.getCartData();
  }

  @override
  Future<void> save(EntityRestaurantItem item) async{
    await localDataCart.save(item);
  }

}