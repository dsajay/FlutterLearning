// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddMemberEntityAdapter extends TypeAdapter<AddMemberEntity> {
  @override
  final int typeId = 1;

  @override
  AddMemberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddMemberEntity(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[6] as String?,
    )
      ..id = fields[0] as int
      ..date = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, AddMemberEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memberName)
      ..writeByte(2)
      ..write(obj.memberCode)
      ..writeByte(3)
      ..write(obj.memberPhone)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddMemberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
