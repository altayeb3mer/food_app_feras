import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';

abstract class RepositoryRestaurant{
  Future<List<EntityRestaurant>> getRestaurants();
}