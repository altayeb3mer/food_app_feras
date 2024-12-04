import 'package:food_app/data/models/response/restaurant/dto_restaurant_category.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurant_item.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:json_annotation/json_annotation.dart';

class EntityRestaurantCategory {
  int? id;
  String? categoryName;
  int? restaurantId;
  String? createdAt;
  String? updatedAt;
  List<EntityRestaurantItem>? items;


  EntityRestaurantCategory({
    this.id,
    this.categoryName,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });


  // Factory constructor for creating an instance from DtoRestaurantCategory
  factory EntityRestaurantCategory.from(DtoRestaurantCategory? dto) {
    return EntityRestaurantCategory(
      id: dto?.id,
      categoryName: dto?.categoryName,
      restaurantId: dto?.restaurantId,
      createdAt: dto?.createdAt,
      updatedAt: dto?.updatedAt,
      items: dto?.items?.map((e) => EntityRestaurantItem.from(e)).toList() ?? [],
    );
  }
}
