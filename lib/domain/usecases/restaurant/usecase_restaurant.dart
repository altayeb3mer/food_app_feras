import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/domain/repository/restaurant/repository_restaurant.dart';

class UseCaseRestaurant {
  RepositoryRestaurant repositoryRestaurant;

  UseCaseRestaurant({required this.repositoryRestaurant});

  Future<List<EntityRestaurant>> getRestaurants() async {
    return await repositoryRestaurant.getRestaurants();
  }
}
