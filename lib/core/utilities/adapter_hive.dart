

import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:hive/hive.dart';

class AdapterHive{
  static void registerAdapters(){
    Hive.registerAdapter(EntityRestaurantItemAdapter());
  }
}