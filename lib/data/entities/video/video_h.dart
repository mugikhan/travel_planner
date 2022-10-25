import 'package:hive_flutter/hive_flutter.dart';

import 'video.dart';

part 'video_h.g.dart';

@HiveType(typeId: 1)
class VideoH extends HiveObject {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String description;
  @HiveField(5, defaultValue: false)
  bool looping;
  @HiveField(6, defaultValue: false)
  bool autoPlay;
  @HiveField(7, defaultValue: false)
  bool completed;
  @HiveField(8, defaultValue: false)
  bool enabled;
  @HiveField(9, defaultValue: 0.0)
  num progress;

  VideoH({
    required this.uuid,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.url,
    this.looping = false,
    this.autoPlay = false,
    this.completed = false,
    this.enabled = false,
    this.progress = 0.0,
  });

  factory VideoH.fromVideoObject(Video video) {
    return VideoH(
      uuid: video.uuid,
      title: video.title,
      description: video.description,
      thumbnail: video.thumbnail,
      url: video.url,
      looping: video.looping,
      autoPlay: video.autoPlay,
      completed: video.completed,
      enabled: video.enabled,
      progress: video.progress,
    );
  }
}
