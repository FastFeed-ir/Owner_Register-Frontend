// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_subscription.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSubscriptionAdapter extends TypeAdapter<HiveSubscription> {
  @override
  final int typeId = 3;

  @override
  HiveSubscription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSubscription(
      id: fields[0] as int?,
      business_owner: fields[1] as int?,
      store: fields[2] as int?,
      period: fields[3] as int?,
      amount: fields[4] as double?,
      url: fields[5] as String?,
      startDate: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSubscription obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.business_owner)
      ..writeByte(2)
      ..write(obj.store)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.startDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSubscriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
