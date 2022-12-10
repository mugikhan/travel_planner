// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  @HiveField(0)
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "token_type")
  String get tokenType => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "expires_in")
  int get expiresIn => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "refresh_token")
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "access_token") String accessToken,
      @HiveField(1) @JsonKey(name: "token_type") String tokenType,
      @HiveField(2) @JsonKey(name: "expires_in") int expiresIn,
      @HiveField(3) @JsonKey(name: "refresh_token") String refreshToken});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "access_token") String accessToken,
      @HiveField(1) @JsonKey(name: "token_type") String tokenType,
      @HiveField(2) @JsonKey(name: "expires_in") int expiresIn,
      @HiveField(3) @JsonKey(name: "refresh_token") String refreshToken});
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res, _$_Token>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_Token(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: "TokenAdapter")
class _$_Token implements _Token {
  const _$_Token(
      {@HiveField(0)
      @JsonKey(name: "access_token")
          required this.accessToken,
      @HiveField(1)
      @JsonKey(name: "token_type")
          required this.tokenType,
      @HiveField(2)
      @JsonKey(name: "expires_in")
          required this.expiresIn,
      @HiveField(3)
      @JsonKey(name: "refresh_token")
          required this.refreshToken});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "access_token")
  final String accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: "token_type")
  final String tokenType;
  @override
  @HiveField(2)
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @override
  @HiveField(3)
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, expiresIn, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {@HiveField(0)
      @JsonKey(name: "access_token")
          required final String accessToken,
      @HiveField(1)
      @JsonKey(name: "token_type")
          required final String tokenType,
      @HiveField(2)
      @JsonKey(name: "expires_in")
          required final int expiresIn,
      @HiveField(3)
      @JsonKey(name: "refresh_token")
          required final String refreshToken}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "access_token")
  String get accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: "token_type")
  String get tokenType;
  @override
  @HiveField(2)
  @JsonKey(name: "expires_in")
  int get expiresIn;
  @override
  @HiveField(3)
  @JsonKey(name: "refresh_token")
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}
