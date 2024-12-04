
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dto_restaurant_item.g.dart';
@JsonSerializable()
class DtoRestaurantItem {
  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'item_name')
  String? itemName;
  @JsonKey(name:'item_description')
  String? itemDescription;
  @JsonKey(name:'item_size')
  String? itemSize;
  @JsonKey(name:'price')
  String? price;
  @JsonKey(name:'category_id')
  int? categoryId;
  @JsonKey(name:'created_at')
  String? createdAt;
  @JsonKey(name:'updated_at')
  String? updatedAt;
  @JsonKey(name:'image_logo')
  String? imageLogo;
  @JsonKey(name:'image_banner')
  String? imageBanner;

  DtoRestaurantItem({
    this.id,
    this.itemName,
    this.itemDescription,
    this.itemSize,
    this.price,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.imageLogo,
    this.imageBanner
  }
  );


  factory DtoRestaurantItem.fromJson(Map<String, dynamic> json) => _$DtoRestaurantItemFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRestaurantItemToJson(this);


  //entity to dto
  factory DtoRestaurantItem.from(EntityRestaurantItem? entity) {
    return DtoRestaurantItem(
      id: entity?.id,
      itemName: entity?.itemName,
      itemDescription: entity?.itemDescription,
      itemSize: entity?.itemSize,
      price: entity?.price,
      categoryId: entity?.categoryId,
      createdAt: entity?.createdAt,
      updatedAt: entity?.updatedAt,
      imageLogo: entity?.imageLogo,
      imageBanner: entity?.imageBanner,
    );
  }
}