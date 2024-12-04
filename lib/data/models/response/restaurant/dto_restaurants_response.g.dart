// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRestaurantResponse _$DtoRestaurantResponseFromJson(
        Map<String, dynamic> json) =>
    DtoRestaurantResponse(
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => DtoRestaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoRestaurantResponseToJson(
        DtoRestaurantResponse instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };
