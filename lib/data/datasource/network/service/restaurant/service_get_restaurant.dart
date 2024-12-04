import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/network_constants.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurants_response.dart';

abstract class ServiceGetRestaurant {
  Future<DtoRestaurantResponse?> getRestaurants();
}
class ServiceGetRestaurantImpl extends ServiceGetRestaurant{
  final DioClient dioClient;

  ServiceGetRestaurantImpl({required this.dioClient});
  @override
  Future<DtoRestaurantResponse?> getRestaurants()async {
    try {
      final Response response = await dioClient.dio
          .get(NetworkConstants.getRestaurant);
      final res=DtoRestaurantResponse.fromJson(response.data['data']);
      return res;
    }  on DioException catch (e) {
      if(e.response?.statusCode==422){
        String? msg = e.response?.data["message"];
        AppMassager.showError(msg??'Error');
      }
    }
  }
}