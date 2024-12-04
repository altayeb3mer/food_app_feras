// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_restaurant_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityRestaurantItemAdapter extends TypeAdapter<EntityRestaurantItem> {
  @override
  final int typeId = 1;

  @override
  EntityRestaurantItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityRestaurantItem(
      id: fields[0] as int?,
      itemName: fields[1] as String?,
      itemDescription: fields[2] as String?,
      itemSize: fields[3] as String?,
      price: fields[4] as String?,
      categoryId: fields[5] as int?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      imageLogo: fields[8] as String?,
      imageBanner: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EntityRestaurantItem obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemName)
      ..writeByte(2)
      ..write(obj.itemDescription)
      ..writeByte(3)
      ..write(obj.itemSize)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.imageLogo)
      ..writeByte(9)
      ..write(obj.imageBanner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityRestaurantItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
