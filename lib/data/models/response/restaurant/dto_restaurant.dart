import 'package:food_app/data/models/response/restaurant/dto_restaurant_category.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurant_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_restaurant.g.dart';

@JsonSerializable()
class DtoRestaurant {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'restaurant_name')
  String? restaurantName;
  @JsonKey(name: 'restaurant_main_logo')
  String? restaurantMainLogo;
  @JsonKey(name: 'restaurant_main_banner')
  String? restaurantMainBanner;
  @JsonKey(name: 'restaurant_description')
  String? restaurantDescription;
  @JsonKey(name: 'restaurant_location')
  String? restaurantLocation;
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'longitude')
  String? longitude;
  @JsonKey(name: 'delivery_fee')
  String? deliveryFee;
  @JsonKey(name: 'is_delivery_free')
  int? isDeliveryFree;
  @JsonKey(name: 'min_order_amount')
  String? minOrderAmount;
  @JsonKey(name: 'background_color')
  String? backgroundColor;
  @JsonKey(name: 'open_time')
  String? openTime;
  @JsonKey(name: 'close_time')
  String? closeTime;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'is_open_status')
  DtoRestaurantStatus? dtoRestaurantStatus;
  @JsonKey(name: 'image_logo_url')
  String? imageLogoUrl;
  @JsonKey(name: 'image_banner_url')
  String? imageBannerUrl;
  @JsonKey(name: 'categories')
  List<DtoRestaurantCategory>? dtoRestaurantCategory;

  DtoRestaurant({
    this.id,
    this.restaurantName,
    this.restaurantMainLogo,
    this.restaurantMainBanner,
    this.restaurantDescription,
    this.restaurantLocation,
    this.latitude,
    this.longitude,
    this.deliveryFee,
    this.isDeliveryFree,
    this.minOrderAmount,
    this.backgroundColor,
    this.openTime,
    this.closeTime,
    this.createdAt,
    this.updatedAt,
    this.dtoRestaurantStatus,
    this.imageLogoUrl,
    this.imageBannerUrl,
    this.dtoRestaurantCategory,
  });

  factory DtoRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DtoRestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRestaurantToJson(this);
}
