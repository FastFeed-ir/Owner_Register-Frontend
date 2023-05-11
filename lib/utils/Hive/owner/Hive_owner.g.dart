// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_owner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOwnerAdapter extends TypeAdapter<HiveOwner> {
  @override
  final int typeId = 1;

  @override
  HiveOwner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOwner(
      id: fields[0] as int?,
      phone_number: fields[3] as String?,
      first_name: fields[1] as String?,
      last_name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveOwner obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.first_name)
      ..writeByte(2)
      ..write(obj.last_name)
      ..writeByte(3)
      ..write(obj.phone_number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
