import 'package:json_annotation/json_annotation.dart';

part 'dto_restaurant_status.g.dart';

@JsonSerializable()
class DtoRestaurantStatus {
  @JsonKey(name: 'is_open')
  bool? isOpen;
  @JsonKey(name: 'open_time')
  String? openTime;
  @JsonKey(name: 'close_time')
  String? closeTime;

  DtoRestaurantStatus({
    this.isOpen,
    this.openTime,
    this.closeTime,
  });

  factory DtoRestaurantStatus.fromJson(Map<String, dynamic> json) =>
      _$DtoRestaurantStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRestaurantStatusToJson(this);
}
