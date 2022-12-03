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
  switch (json['runtimeType']) {
    case 'default':
      return _User.fromJson(json);
    case 'auth':
      return _AuthUser.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'User',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)
        $default, {
    required TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)
        auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult? Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(_AuthUser value) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(_AuthUser value)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(_AuthUser value)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "emailAddress") String email,
      @HiveField(1) String givenName,
      @HiveField(2) String familyName,
      @HiveField(3) String? profilePicture});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? givenName = null,
    Object? familyName = null,
    Object? profilePicture = freezed,
  }) {
    return _then(_$_User(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: "UserAdapter")
class _$_User extends _User with DiagnosticableTreeMixin {
  const _$_User(
      {@HiveField(0) @JsonKey(name: "emailAddress") required this.email,
      @HiveField(1) required this.givenName,
      @HiveField(2) required this.familyName,
      @HiveField(3) required this.profilePicture,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(email: $email, givenName: $givenName, familyName: $familyName, profilePicture: $profilePicture)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('givenName', givenName))
      ..add(DiagnosticsProperty('familyName', familyName))
      ..add(DiagnosticsProperty('profilePicture', profilePicture));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, givenName, familyName, profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)
        $default, {
    required TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)
        auth,
  }) {
    return $default(email, givenName, familyName, profilePicture);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult? Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
  }) {
    return $default?.call(email, givenName, familyName, profilePicture);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, givenName, familyName, profilePicture);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(_AuthUser value) auth,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(_AuthUser value)? auth,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(_AuthUser value)? auth,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {@HiveField(0) @JsonKey(name: "emailAddress") required final String email,
      @HiveField(1) required final String givenName,
      @HiveField(2) required final String familyName,
      @HiveField(3) required final String? profilePicture}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @HiveField(0)
  @JsonKey(name: "emailAddress")
  String get email;
  @HiveField(1)
  String get givenName;
  @HiveField(2)
  String get familyName;
  @HiveField(3)
  String? get profilePicture;
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthUserCopyWith<$Res> {
  factory _$$_AuthUserCopyWith(
          _$_AuthUser value, $Res Function(_$_AuthUser) then) =
      __$$_AuthUserCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String username,
      String password,
      @JsonKey(name: "grant_type") String grantType});
}

/// @nodoc
class __$$_AuthUserCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$_AuthUser>
    implements _$$_AuthUserCopyWith<$Res> {
  __$$_AuthUserCopyWithImpl(
      _$_AuthUser _value, $Res Function(_$_AuthUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? grantType = null,
  }) {
    return _then(_$_AuthUser(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUser extends _AuthUser with DiagnosticableTreeMixin {
  const _$_AuthUser(
      {required this.username,
      required this.password,
      @JsonKey(name: "grant_type") this.grantType = 'password',
      final String? $type})
      : $type = $type ?? 'auth',
        super._();

  factory _$_AuthUser.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  @JsonKey(name: "grant_type")
  final String grantType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User.auth(username: $username, password: $password, grantType: $grantType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User.auth'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('grantType', grantType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthUser &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, grantType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthUserCopyWith<_$_AuthUser> get copyWith =>
      __$$_AuthUserCopyWithImpl<_$_AuthUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)
        $default, {
    required TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)
        auth,
  }) {
    return auth(username, password, grantType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult? Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
  }) {
    return auth?.call(username, password, grantType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "emailAddress") String email,
            @HiveField(1) String givenName,
            @HiveField(2) String familyName,
            @HiveField(3) String? profilePicture)?
        $default, {
    TResult Function(String username, String password,
            @JsonKey(name: "grant_type") String grantType)?
        auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(username, password, grantType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(_AuthUser value) auth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(_AuthUser value)? auth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(_AuthUser value)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserToJson(
      this,
    );
  }
}

abstract class _AuthUser extends User {
  const factory _AuthUser(
      {required final String username,
      required final String password,
      @JsonKey(name: "grant_type") final String grantType}) = _$_AuthUser;
  const _AuthUser._() : super._();

  factory _AuthUser.fromJson(Map<String, dynamic> json) = _$_AuthUser.fromJson;

  String get username;
  String get password;
  @JsonKey(name: "grant_type")
  String get grantType;
  @JsonKey(ignore: true)
  _$$_AuthUserCopyWith<_$_AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}
