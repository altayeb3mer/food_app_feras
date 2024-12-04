// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_restaurant_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRestaurantItem _$DtoRestaurantItemFromJson(Map<String, dynamic> json) =>
    DtoRestaurantItem(
      id: (json['id'] as num?)?.toInt(),
      itemName: json['item_name'] as String?,
      itemDescription: json['item_description'] as String?,
      itemSize: json['item_size'] as String?,
      price: json['price'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      imageLogo: json['image_logo'] as String?,
      imageBanner: json['image_banner'] as String?,
    );

Map<String, dynamic> _$DtoRestaurantItemToJson(DtoRestaurantItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'item_description': instance.itemDescription,
      'item_size': instance.itemSize,
      'price': instance.price,
      'category_id': instance.categoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image_logo': instance.imageLogo,
      'image_banner': instance.imageBanner,
    };
