// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_restaurant_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRestaurantStatus _$DtoRestaurantStatusFromJson(Map<String, dynamic> json) =>
    DtoRestaurantStatus(
      isOpen: json['is_open'] as bool?,
      openTime: json['open_time'] as String?,
      closeTime: json['close_time'] as String?,
    );

Map<String, dynamic> _$DtoRestaurantStatusToJson(
        DtoRestaurantStatus instance) =>
    <String, dynamic>{
      'is_open': instance.isOpen,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
    };
