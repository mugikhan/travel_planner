import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  @HiveType(typeId: 1, adapterName: "TokenAdapter")
  const factory Token({
    @HiveField(0) @JsonKey(name: "access_token") required String accessToken,
    @HiveField(1) @JsonKey(name: "token_type") required String tokenType,
    @HiveField(2) @JsonKey(name: "expires_in") required int expiresIn,
    @HiveField(3) @JsonKey(name: "refresh_token") required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}
