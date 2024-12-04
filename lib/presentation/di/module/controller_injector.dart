

import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/presentation/auth/controller/store_auth.dart';
import 'package:food_app/presentation/dashboard/controller/controller_cart.dart';
import 'package:food_app/presentation/dashboard/controller/controller_dashboard.dart';
import 'package:food_app/presentation/dashboard/controller/main_nav_controller.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';

class ControllerInjector {
  static Future<void> executeInjector() async {
    getIt.registerLazySingleton<MainNavController>(() => MainNavController());
    getIt.registerLazySingleton<StoreAuth>(() => StoreAuth(useCaseAuth: injector()));
    getIt.registerLazySingleton<ControllerDashboard>(() => ControllerDashboard(useCaseRestaurant: injector()));
    getIt.registerLazySingleton<ControllerRestaurant>(() => ControllerRestaurant());
    getIt.registerLazySingleton<ControllerCart>(() => ControllerCart(useCaseCart: injector()));
  }
}