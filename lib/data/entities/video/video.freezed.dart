// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Video _$VideoFromJson(Map<String, dynamic> json) {
  return _Video.fromJson(json);
}

/// @nodoc
mixin _$Video {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get looping => throw _privateConstructorUsedError;
  set looping(bool value) => throw _privateConstructorUsedError;
  bool get autoPlay => throw _privateConstructorUsedError;
  set autoPlay(bool value) => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  set completed(bool value) => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  set enabled(bool value) => throw _privateConstructorUsedError;
  num get progress => throw _privateConstructorUsedError;
  set progress(num value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res, Video>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      String thumbnail,
      String url,
      String description,
      bool looping,
      bool autoPlay,
      bool completed,
      bool enabled,
      num progress});
}

/// @nodoc
class _$VideoCopyWithImpl<$Res, $Val extends Video>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? url = null,
    Object? description = null,
    Object? looping = null,
    Object? autoPlay = null,
    Object? completed = null,
    Object? enabled = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      looping: null == looping
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: null == autoPlay
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$$_VideoCopyWith(_$_Video value, $Res Function(_$_Video) then) =
      __$$_VideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      String thumbnail,
      String url,
      String description,
      bool looping,
      bool autoPlay,
      bool completed,
      bool enabled,
      num progress});
}

/// @nodoc
class __$$_VideoCopyWithImpl<$Res> extends _$VideoCopyWithImpl<$Res, _$_Video>
    implements _$$_VideoCopyWith<$Res> {
  __$$_VideoCopyWithImpl(_$_Video _value, $Res Function(_$_Video) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? url = null,
    Object? description = null,
    Object? looping = null,
    Object? autoPlay = null,
    Object? completed = null,
    Object? enabled = null,
    Object? progress = null,
  }) {
    return _then(_$_Video(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      looping: null == looping
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: null == autoPlay
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Video implements _Video {
  _$_Video(
      {required this.uuid,
      required this.title,
      required this.thumbnail,
      required this.url,
      required this.description,
      this.looping = false,
      this.autoPlay = false,
      this.completed = false,
      this.enabled = false,
      this.progress = 0.0});

  factory _$_Video.fromJson(Map<String, dynamic> json) =>
      _$$_VideoFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  final String thumbnail;
  @override
  final String url;
  @override
  final String description;
  @override
  @JsonKey()
  bool looping;
  @override
  @JsonKey()
  bool autoPlay;
  @override
  @JsonKey()
  bool completed;
  @override
  @JsonKey()
  bool enabled;
  @override
  @JsonKey()
  num progress;

  @override
  String toString() {
    return 'Video(uuid: $uuid, title: $title, thumbnail: $thumbnail, url: $url, description: $description, looping: $looping, autoPlay: $autoPlay, completed: $completed, enabled: $enabled, progress: $progress)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoCopyWith<_$_Video> get copyWith =>
      __$$_VideoCopyWithImpl<_$_Video>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoToJson(
      this,
    );
  }
}

abstract class _Video implements Video {
  factory _Video(
      {required final String uuid,
      required final String title,
      required final String thumbnail,
      required final String url,
      required final String description,
      bool looping,
      bool autoPlay,
      bool completed,
      bool enabled,
      num progress}) = _$_Video;

  factory _Video.fromJson(Map<String, dynamic> json) = _$_Video.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  String get thumbnail;
  @override
  String get url;
  @override
  String get description;
  @override
  bool get looping;
  set looping(bool value);
  @override
  bool get autoPlay;
  set autoPlay(bool value);
  @override
  bool get completed;
  set completed(bool value);
  @override
  bool get enabled;
  set enabled(bool value);
  @override
  num get progress;
  set progress(num value);
  @override
  @JsonKey(ignore: true)
  _$$_VideoCopyWith<_$_Video> get copyWith =>
      throw _privateConstructorUsedError;
}
