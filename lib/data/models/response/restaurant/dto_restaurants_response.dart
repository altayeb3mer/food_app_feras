import 'package:food_app/data/models/response/restaurant/dto_restaurant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_restaurants_response.g.dart';

@JsonSerializable()
class DtoRestaurantResponse {
  @JsonKey(name: 'restaurants')
  List<DtoRestaurant>? restaurants;

  DtoRestaurantResponse({
    this.restaurants,
  });

  factory DtoRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$DtoRestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRestaurantResponseToJson(this);
}
