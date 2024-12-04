import 'package:food_app/data/models/response/restaurant/dto_restaurant_status.dart';

class EntityRestaurantStatus {
  bool? isOpen;
  String? openTime;
  String? closeTime;

  EntityRestaurantStatus({
    this.isOpen,
    this.openTime,
    this.closeTime,
  });

factory  EntityRestaurantStatus.from(DtoRestaurantStatus? dto) {
    return EntityRestaurantStatus(
      isOpen: dto?.isOpen,
      openTime: dto?.openTime,
      closeTime: dto?.closeTime,
    );
  }
}
