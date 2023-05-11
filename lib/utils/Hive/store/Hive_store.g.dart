// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreAdapter extends TypeAdapter<HiveStore> {
  @override
  final int typeId = 2;

  @override
  HiveStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStore(
      id: fields[0] as int?,
      business_owner: fields[1] as int?,
      title: fields[2] as String?,
      logo: fields[3] as String?,
      business_type: fields[4] as int?,
      state: fields[5] as int?,
      city: fields[6] as String?,
      address: fields[7] as String?,
      owner_phone_number: fields[8] as String?,
      telephone_number: fields[9] as String?,
      tables_count: fields[10] as int?,
      instagram_page_link: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStore obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.business_owner)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.logo)
      ..writeByte(4)
      ..write(obj.business_type)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.owner_phone_number)
      ..writeByte(9)
      ..write(obj.telephone_number)
      ..writeByte(10)
      ..write(obj.tables_count)
      ..writeByte(11)
      ..write(obj.instagram_page_link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
