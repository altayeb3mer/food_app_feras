import 'package:food_app/data/datasource/network/service/restaurant/service_get_restaurant.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/domain/repository/restaurant/repository_restaurant.dart';

class RepositoryRestaurantImpl extends RepositoryRestaurant {
  ServiceGetRestaurant serviceGetRestaurant;

  RepositoryRestaurantImpl({required this.serviceGetRestaurant});

  @override
  Future<List<EntityRestaurant>> getRestaurants() async {
    try {
      final data = await serviceGetRestaurant.getRestaurants();
      final list = data?.restaurants
              ?.map((dto) => EntityRestaurant.from(dto))
              .toList() ??
          [];
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
