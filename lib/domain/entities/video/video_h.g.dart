// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_h.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoHAdapter extends TypeAdapter<VideoH> {
  @override
  final int typeId = 1;

  @override
  VideoH read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoH(
      uuid: fields[0] as String,
      title: fields[1] as String,
      description: fields[4] as String,
      thumbnail: fields[2] as String,
      url: fields[3] as String,
      looping: fields[5] == null ? false : fields[5] as bool,
      autoPlay: fields[6] == null ? false : fields[6] as bool,
      completed: fields[7] == null ? false : fields[7] as bool,
      enabled: fields[8] == null ? false : fields[8] as bool,
      progress: fields[9] == null ? 0.0 : fields[9] as num,
    );
  }

  @override
  void write(BinaryWriter writer, VideoH obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.looping)
      ..writeByte(6)
      ..write(obj.autoPlay)
      ..writeByte(7)
      ..write(obj.completed)
      ..writeByte(8)
      ..write(obj.enabled)
      ..writeByte(9)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoHAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
