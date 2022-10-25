// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<_$_User> {
  @override
  final int typeId = 0;

  @override
  _$_User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_User(
      email: fields[0] as String,
      givenName: fields[1] as String,
      familyName: fields[2] as String,
      profilePicture: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.givenName)
      ..writeByte(2)
      ..write(obj.familyName)
      ..writeByte(3)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uuid: json['uuid'] as String?,
      email: json['emailAddress'] as String,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      profilePicture: json['profilePicture'] as String?,
      updatedAt: json['updatedAt'] as num?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'emailAddress': instance.email,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'profilePicture': instance.profilePicture,
      'updatedAt': instance.updatedAt,
    };
