// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_success.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSuccessfulPurchaseAdapter
    extends TypeAdapter<HiveSuccessfulPurchase> {
  @override
  final int typeId = 6;

  @override
  HiveSuccessfulPurchase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSuccessfulPurchase(
      storeName: fields[0] as String?,
      business_owner: fields[1] as int?,
      url: fields[2] as String?,
      period: fields[3] as int?,
      amount: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSuccessfulPurchase obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.storeName)
      ..writeByte(1)
      ..write(obj.business_owner)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSuccessfulPurchaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
