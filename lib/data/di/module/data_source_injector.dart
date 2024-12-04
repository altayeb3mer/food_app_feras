import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/datasource/local/auth/local_data_user.dart';
import 'package:food_app/data/datasource/local/cart/local_data_cart.dart';
import 'package:food_app/data/datasource/network/service/auth/service_login.dart';
import 'package:food_app/data/datasource/network/service/auth/service_register.dart';
import 'package:food_app/data/datasource/network/service/restaurant/service_get_restaurant.dart';

class DataSourceInjector {
  static Future<void> executeInjector() async {
    // getIt.registerLazySingleton<DioClient>(() => DioClient());
    final dioClient = await DioClient.create();
    getIt.registerLazySingleton<DioClient>(()=>dioClient);
    getIt.registerLazySingleton<ServiceLogin>(() => ServiceLoginImpl(
          dioClient: injector(),
        ));
    getIt.registerLazySingleton<ServiceRegister>(() => ServiceRegisterImpl(
          dioClient: injector(),
        ));
    getIt.registerLazySingleton<LocalDataUser>(() => LocalDataUserImpl());
    getIt.registerLazySingleton<ServiceGetRestaurant>(() => ServiceGetRestaurantImpl(dioClient: injector()));
    getIt.registerLazySingleton<LocalDataCart>(() => LocalDataCartImpl());
  }
}
