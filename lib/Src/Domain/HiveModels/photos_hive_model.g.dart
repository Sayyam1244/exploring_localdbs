// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotosHiveModelAdapter extends TypeAdapter<PhotosHiveModel> {
  @override
  final int typeId = 1;

  @override
  PhotosHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotosHiveModel(
      albumId: fields[1] as int?,
      id: fields[2] as int?,
      title: fields[3] as String?,
      url: fields[4] as String?,
      thumbnailUrl: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotosHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.albumId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotosHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
