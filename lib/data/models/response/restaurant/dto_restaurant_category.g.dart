// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_restaurant_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRestaurantCategory _$DtoRestaurantCategoryFromJson(
        Map<String, dynamic> json) =>
    DtoRestaurantCategory(
      id: (json['id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      restaurantId: (json['restaurant_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DtoRestaurantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoRestaurantCategoryToJson(
        DtoRestaurantCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'restaurant_id': instance.restaurantId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'items': instance.items,
    };
