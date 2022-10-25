import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  @HiveType(typeId: 0, adapterName: "UserAdapter")
  const factory User({
    String? uuid,
    @HiveField(0) @JsonKey(name: "emailAddress") required String email,
    @HiveField(1) required String givenName,
    @HiveField(2) required String familyName,
    @HiveField(3) required String? profilePicture,
    num? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  String getFullName() {
    return "$givenName $familyName";
  }
}
