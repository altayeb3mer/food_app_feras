import 'package:food_app/core/utilities/hive_constant.dart';
import 'package:food_app/data/models/response/restaurant/dto_restaurant_item.dart';
import 'package:hive/hive.dart';

part 'entity_restaurant_item.g.dart';

@HiveType(typeId: HiveConstant.cart)
class EntityRestaurantItem extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? itemName;
  @HiveField(2)
  String? itemDescription;
  @HiveField(3)
  String? itemSize;
  @HiveField(4)
  String? price;
  @HiveField(5)
  int? categoryId;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;
  @HiveField(8)
  String? imageLogo;
  @HiveField(9)
  String? imageBanner;

  EntityRestaurantItem({
    this.id,
    this.itemName,
    this.itemDescription,
    this.itemSize,
    this.price,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.imageLogo,
    this.imageBanner,
  });

 factory EntityRestaurantItem.from(DtoRestaurantItem? dto) {
    return EntityRestaurantItem(
      id: dto?.id,
      itemName: dto?.itemName,
      itemDescription: dto?.itemDescription,
      itemSize: dto?.itemSize,
      price: dto?.price,
      categoryId: dto?.categoryId,
      createdAt: dto?.createdAt,
      updatedAt: dto?.updatedAt,
      imageLogo: dto?.imageLogo,
      imageBanner: dto?.imageBanner,
    );
  }
}
