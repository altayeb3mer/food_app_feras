import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurant_item.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:hive/hive.dart';

abstract class LocalDataCart {
  Future<void> save(EntityRestaurantItem item);

  Future<List<EntityRestaurantItem>?> getCartData();

  Future<void> deleteItem(EntityRestaurantItem item);

  Future<void> clearCart();
}

class LocalDataCartImpl extends LocalDataCart {
  final boxName = 'cartBox';

  @override
  Future<void> clearCart() async{
    try {
      final box = await _getBox<EntityRestaurantItem>();
      await box.clear();
    } on Exception catch (e) {
      Logging.error('Error: deleteItem cart--$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItem(EntityRestaurantItem item) async {
    try {
      final box = await _getBox<EntityRestaurantItem>();
      await box.delete(item.id);
    } on Exception catch (e) {
      Logging.error('Error: deleteItem cart--$e');
      rethrow;
    }
  }

  @override
  Future<List<EntityRestaurantItem>?> getCartData() async {
    try {
      final box =await _getBox<EntityRestaurantItem>();
      final data = box.values.toList();
      return data;
    } on Exception catch (e) {
      Logging.error('Error: getCartData--$e');
      rethrow;
    }
  }

  @override
  Future<void> save(EntityRestaurantItem item) async {
    try {
      final box = await _getBox<EntityRestaurantItem>();
      await box.put(item.id, item);
    } on Exception catch (e) {
      Logging.error('Error: save to hive--$e');
      rethrow;
    }
  }

  Future<Box<T>> _getBox<T>()async{
   return Hive.isBoxOpen(boxName)
        ? Hive.box<T>(boxName)
        : await Hive.openBox<T>(boxName);
  }

}
