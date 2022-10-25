// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get uuid => throw _privateConstructorUsedError;
  @HiveField(0)
  @JsonKey(name: "emailAddress")
  String get email => throw _privateConstructorUsedError;
  @HiveField(1)
  String get givenName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get familyName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get profilePicture => throw _privateConstructorUsedError;
  num? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? uuid,
      @HiveField(0) @JsonKey(name: "emailAddress") String email,
      @HiveField(1) String givenName,
      @HiveField(2) String familyName,
      @HiveField(3) String? profilePicture,
      num? updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? email = null,
    Object? givenName = null,
    Object? familyName = null,
    Object? profilePicture = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      @HiveField(0) @JsonKey(name: "emailAddress") String email,
      @HiveField(1) String givenName,
      @HiveField(2) String familyName,
      @HiveField(3) String? profilePicture,
      num? updatedAt});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? email = null,
    Object? givenName = null,
    Object? familyName = null,
    Object? profilePicture = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_User(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: "UserAdapter")
class _$_User extends _User with DiagnosticableTreeMixin {
  const _$_User(
      {this.uuid,
      @HiveField(0) @JsonKey(name: "emailAddress") required this.email,
      @HiveField(1) required this.givenName,
      @HiveField(2) required this.familyName,
      @HiveField(3) required this.profilePicture,
      this.updatedAt})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? uuid;
  @override
  @HiveField(0)
  @JsonKey(name: "emailAddress")
  final String email;
  @override
  @HiveField(1)
  final String givenName;
  @override
  @HiveField(2)
  final String familyName;
  @override
  @HiveField(3)
  final String? profilePicture;
  @override
  final num? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(uuid: $uuid, email: $email, givenName: $givenName, familyName: $familyName, profilePicture: $profilePicture, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('givenName', givenName))
      ..add(DiagnosticsProperty('familyName', familyName))
      ..add(DiagnosticsProperty('profilePicture', profilePicture))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, email, givenName,
      familyName, profilePicture, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {final String? uuid,
      @HiveField(0) @JsonKey(name: "emailAddress") required final String email,
      @HiveField(1) required final String givenName,
      @HiveField(2) required final String familyName,
      @HiveField(3) required final String? profilePicture,
      final num? updatedAt}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get uuid;
  @override
  @HiveField(0)
  @JsonKey(name: "emailAddress")
  String get email;
  @override
  @HiveField(1)
  String get givenName;
  @override
  @HiveField(2)
  String get familyName;
  @override
  @HiveField(3)
  String? get profilePicture;
  @override
  num? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
