// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PDVAdapter extends TypeAdapter<PDV> {
  @override
  final int typeId = 1;

  @override
  PDV read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PDV(
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PDV obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PDVAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
