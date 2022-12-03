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
    @HiveField(0) @JsonKey(name: "emailAddress") required String email,
    @HiveField(1) required String givenName,
    @HiveField(2) required String familyName,
    @HiveField(3) required String? profilePicture,
  }) = _User;

  const factory User.auth({
    required String username,
    required String password,
    @JsonKey(name: "grant_type") @Default('password') String grantType,
  }) = _AuthUser;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  // String getFullName() {
  //   return "$givenName $familyName";
  // }
}
