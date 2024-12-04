import 'package:food_app/data/models/response/restaurant/dto_restaurant.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurant_status.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_category.dart';


class EntityRestaurant {
  int? id;
  String? restaurantName;
  String? restaurantMainLogo;
  String? restaurantMainBanner;
  String? restaurantDescription;
  String? restaurantLocation;
  String? latitude;
  String? longitude;
  String? deliveryFee;
  int? isDeliveryFree;
  String? minOrderAmount;
  String? backgroundColor;
  String? openTime;
  String? closeTime;
  String? createdAt;
  String? updatedAt;
  DtoRestaurantStatus? dtoRestaurantStatus;
  String? imageLogoUrl;
  String? imageBannerUrl;
  List<EntityRestaurantCategory>? entityRestaurantCategory;

  EntityRestaurant({
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
    this.entityRestaurantCategory,
  });

  factory EntityRestaurant.from(DtoRestaurant? dto) {
    return EntityRestaurant(
      id: dto?.id,
      restaurantName: dto?.restaurantName,
      restaurantMainLogo: dto?.restaurantMainLogo,
      restaurantMainBanner: dto?.restaurantMainBanner,
      restaurantDescription: dto?.restaurantDescription,
      restaurantLocation: dto?.restaurantLocation,
      latitude: dto?.latitude,
      longitude: dto?.longitude,
      deliveryFee: dto?.deliveryFee,
      isDeliveryFree: dto?.isDeliveryFree,
      minOrderAmount: dto?.minOrderAmount,
      backgroundColor: dto?.backgroundColor,
      openTime: dto?.openTime,
      closeTime: dto?.closeTime,
      createdAt: dto?.createdAt,
      updatedAt: dto?.updatedAt,
      dtoRestaurantStatus: dto?.dtoRestaurantStatus,
      imageLogoUrl: dto?.imageLogoUrl,
      imageBannerUrl: dto?.imageBannerUrl,
      entityRestaurantCategory: dto?.dtoRestaurantCategory?.map((category) => EntityRestaurantCategory.from(category)).toList(),
    );
  }
}
