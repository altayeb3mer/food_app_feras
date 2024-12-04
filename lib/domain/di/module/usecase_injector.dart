import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/domain/usecases/auth/usecase_auth.dart';
import 'package:food_app/domain/usecases/cart/usecase_cart.dart';
import 'package:food_app/domain/usecases/restaurant/usecase_restaurant.dart';

class UseCaseInjector {
  static Future<void> executeInjector() async {
    getIt.registerLazySingleton<UseCaseAuth>(
        () => UseCaseAuth(repositoryAuth: injector()));
    getIt.registerLazySingleton<UseCaseRestaurant>(
        () => UseCaseRestaurant(repositoryRestaurant: injector()));
    getIt.registerLazySingleton<UseCaseCart>(
        () => UseCaseCart(repositoryCart: injector()));
  }
}
