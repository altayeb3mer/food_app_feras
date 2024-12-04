import 'package:food_app/data/models/response/restaurant/dto_restaurant_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_restaurant_category.g.dart';

@JsonSerializable()
class DtoRestaurantCategory {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'restaurant_id')
  int? restaurantId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'items')
  List<DtoRestaurantItem>? items;

  DtoRestaurantCategory({
    this.id,
    this.categoryName,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory DtoRestaurantCategory.fromJson(Map<String, dynamic> json) =>
      _$DtoRestaurantCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRestaurantCategoryToJson(this);
}
