// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_verifySub.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveVerifySubAdapter extends TypeAdapter<HiveVerifySub> {
  @override
  final int typeId = 5;

  @override
  HiveVerifySub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveVerifySub(
      periodText: fields[0] as String?,
      period: fields[1] as int?,
      amountText: fields[2] as String?,
      amount: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveVerifySub obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.periodText)
      ..writeByte(1)
      ..write(obj.period)
      ..writeByte(2)
      ..write(obj.amountText)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveVerifySubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
