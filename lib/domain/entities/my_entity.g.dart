// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyEntityAdapter extends TypeAdapter<MyEntity> {
  @override
  final int typeId = 0;

  @override
  MyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyEntity(
      fields[1] as String,
      fields[2] as int,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, MyEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
