import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/data/repository/auth/repository_auth_impl.dart';
import 'package:food_app/data/repository/cart/repository_cart_impl.dart';
import 'package:food_app/data/repository/restaurant/repository_restaurant_impl.dart';
import 'package:food_app/domain/repository/auth/repository_auth.dart';
import 'package:food_app/domain/repository/cart/repository_cart.dart';
import 'package:food_app/domain/repository/restaurant/repository_restaurant.dart';

class RepositoryInjector {
  static Future<void> executeInjector() async {
    getIt.registerLazySingleton<RepositoryAuth>(() => RepositoryAuthImpl(
          serviceLogin: injector(),
          localDataUser: injector(),
          serviceRegister: injector(),
        ));
    getIt.registerLazySingleton<RepositoryRestaurant>(() => RepositoryRestaurantImpl(
          serviceGetRestaurant: injector(),
        ));
    getIt.registerLazySingleton<RepositoryCart>(() => RepositoryCartImpl(
          localDataCart: injector(),
        ));
  }
}
