// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Video _$$_VideoFromJson(Map<String, dynamic> json) => _$_Video(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      looping: json['looping'] as bool? ?? false,
      autoPlay: json['autoPlay'] as bool? ?? false,
      completed: json['completed'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      progress: json['progress'] as num? ?? 0.0,
    );

Map<String, dynamic> _$$_VideoToJson(_$_Video instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'url': instance.url,
      'description': instance.description,
      'looping': instance.looping,
      'autoPlay': instance.autoPlay,
      'completed': instance.completed,
      'enabled': instance.enabled,
      'progress': instance.progress,
    };
