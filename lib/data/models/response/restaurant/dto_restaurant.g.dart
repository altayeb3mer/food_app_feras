// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRestaurant _$DtoRestaurantFromJson(Map<String, dynamic> json) =>
    DtoRestaurant(
      id: (json['id'] as num?)?.toInt(),
      restaurantName: json['restaurant_name'] as String?,
      restaurantMainLogo: json['restaurant_main_logo'] as String?,
      restaurantMainBanner: json['restaurant_main_banner'] as String?,
      restaurantDescription: json['restaurant_description'] as String?,
      restaurantLocation: json['restaurant_location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      deliveryFee: json['delivery_fee'] as String?,
      isDeliveryFree: (json['is_delivery_free'] as num?)?.toInt(),
      minOrderAmount: json['min_order_amount'] as String?,
      backgroundColor: json['background_color'] as String?,
      openTime: json['open_time'] as String?,
      closeTime: json['close_time'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      dtoRestaurantStatus: json['is_open_status'] == null
          ? null
          : DtoRestaurantStatus.fromJson(
              json['is_open_status'] as Map<String, dynamic>),
      imageLogoUrl: json['image_logo_url'] as String?,
      imageBannerUrl: json['image_banner_url'] as String?,
      dtoRestaurantCategory: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => DtoRestaurantCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoRestaurantToJson(DtoRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurant_name': instance.restaurantName,
      'restaurant_main_logo': instance.restaurantMainLogo,
      'restaurant_main_banner': instance.restaurantMainBanner,
      'restaurant_description': instance.restaurantDescription,
      'restaurant_location': instance.restaurantLocation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'delivery_fee': instance.deliveryFee,
      'is_delivery_free': instance.isDeliveryFree,
      'min_order_amount': instance.minOrderAmount,
      'background_color': instance.backgroundColor,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_open_status': instance.dtoRestaurantStatus,
      'image_logo_url': instance.imageLogoUrl,
      'image_banner_url': instance.imageBannerUrl,
      'categories': instance.dtoRestaurantCategory,
    };
