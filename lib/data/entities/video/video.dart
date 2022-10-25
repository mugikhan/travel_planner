import 'package:freezed_annotation/freezed_annotation.dart';

import 'video_h.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@unfreezed
class Video with _$Video {
  factory Video({
    required final String uuid,
    required final String title,
    required final String thumbnail,
    required final String url,
    required final String description,
    @Default(false) bool looping,
    @Default(false) bool autoPlay,
    @Default(false) bool completed,
    @Default(false) bool enabled,
    @Default(0.0) num progress,
  }) = _Video;

  factory Video.fromJson(Map<String, Object?> json) => _$VideoFromJson(json);

  factory Video.fromVideoHObject(VideoH videoH) {
    return Video(
      uuid: videoH.uuid,
      title: videoH.title,
      description: videoH.description,
      thumbnail: videoH.thumbnail,
      url: videoH.url,
      looping: videoH.looping,
      autoPlay: videoH.autoPlay,
      completed: videoH.completed,
      enabled: videoH.enabled,
      progress: videoH.progress,
    );
  }
}
