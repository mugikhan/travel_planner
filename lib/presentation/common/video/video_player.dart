import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../data/entities/video/video.dart';
import '../../design/color_pallete.dart';
import '../utility/string_utils.dart';
import 'center_play_button.dart';
import 'custom_progress_bar.dart';
import 'video_progress_bar.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.video,
    required this.videoProgress,
  }) : super(key: key);

  final Video video;
  final double videoProgress;

  @override
  State<CustomVideoPlayer> createState() => CustomVideoPlayerState();
}

class CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  late Chewie _chewiePlayer;
  double? _latestVolume;
  final ValueNotifier<bool> hideControls = ValueNotifier<bool>(false);
  Timer? _hideTimer;
  Timer? _expandCollapseTimer;
  bool dragging = false;
  late Video currentVideo;

  Timer? _debounce;

  bool get isFullscreen => _chewieController!.isFullScreen;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeVideoPlayer(widget.video);
  }

  @override
  void dispose() {
    if (_videoPlayerController.value.isInitialized) {
      final double progress = _getVideoProgress();
      _updateVideoProgress(progress);
    }
    _debounce?.cancel();
    _videoPlayerController.removeListener(_checkVideoProgress);
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _hideTimer?.cancel();
    _expandCollapseTimer?.cancel();
    super.dispose();
  }

  void initializeVideoPlayer(Video video) async {
    setState(() {
      currentVideo = video;
    });
    _videoPlayerController = VideoPlayerController.network(video.url);

    await _videoPlayerController.initialize();

    //Device aspect ratio for fullscreen video
    // var screenWidthPixels = window.physicalSize.shortestSide;
    // var screenHeightPixels = window.physicalSize.longestSide;
    // double aspectRatio = screenHeightPixels / screenWidthPixels;

    double videoProgress = (widget.videoProgress.toDouble() *
        _videoPlayerController.value.duration.inMilliseconds.toDouble());

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      // autoInitialize: true,
      startAt: videoProgress > 0.0
          ? Duration(milliseconds: videoProgress.toInt())
          : Duration.zero,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      allowPlaybackSpeedChanging: true,
      aspectRatio: 16 / 9,
      allowFullScreen: false,
      allowMuting: false,
      hideControlsTimer: const Duration(seconds: 3),
      showControls: false,
      systemOverlaysOnEnterFullScreen: [],
      systemOverlaysAfterFullScreen: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom
      ],
      overlay: _buildOverlay(),
    );
    _chewiePlayer = Chewie(
      controller: _chewieController!,
    );

    _videoPlayerController.addListener(_checkVideoProgress);

    if (_videoPlayerController.value.isPlaying || _chewieController!.autoPlay) {
      _startHideTimer();
    }

    setState(() {});
  }

  void _startHideTimer() {
    final hideControlsTimer = _chewieController!.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : _chewieController!.hideControlsTimer;
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        hideControls.value = true;
      });
    });
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();

    setState(() {
      hideControls.value = false;

      _startHideTimer();
    });
  }

  void _onExpandCollapse() {
    setState(() {
      hideControls.value = true;

      _chewieController!.toggleFullScreen();
      _expandCollapseTimer = Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  Widget _buildOverlay() {
    return ValueListenableBuilder(
      valueListenable: _videoPlayerController,
      builder: (context, VideoPlayerValue value, child) {
        final bool isFinished = (value.position >= value.duration);
        return GestureDetector(
          onTap: value.isPlaying
              ? _cancelAndRestartTimer
              : () {
                  _hideTimer?.cancel();

                  setState(() {
                    hideControls.value = false;
                  });
                },
          child: ValueListenableBuilder(
              valueListenable: hideControls,
              builder: (context, bool hideControls, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: !hideControls || isFinished
                      ? Container(
                          color: Colors.black.withOpacity(0.4),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              !_chewieController!.isFullScreen
                                  ? const BackButton(
                                      color: ColorPalette.surface,
                                    )
                                  : Container(),
                              Expanded(
                                flex: 4,
                                child: _buildCenterControls(value, isFinished),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildVideoDuration(value),
                                          _buildVideoFullscreen(),
                                        ],
                                      ),
                                    ),
                                    _buildProgressBar()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : AbsorbPointer(
                          key: UniqueKey(),
                          absorbing: hideControls,
                          child: Container(),
                        ),
                );
              }),
        );
      },
    );
  }

  Widget _buildCenterControls(VideoPlayerValue value, bool isFinished) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSkipBack(),
        Flexible(
          flex: 0,
          child: CenterPlayButton(
            iconColor: ColorPalette.surface,
            isFinished: isFinished,
            isPlaying: value.isPlaying,
            onPressed: _playPause,
          ),
        ),
        _buildSkipForward(),
      ],
    );
  }

  GestureDetector _buildSkipBack() {
    return GestureDetector(
      onTap: _skipBack,
      child: Container(
        height: 40,
        color: Colors.transparent,
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.only(
          left: 6.0,
          right: 6.0,
        ),
        child: const Icon(
          CupertinoIcons.gobackward_15,
          color: ColorPalette.surface,
          size: 32.0,
        ),
      ),
    );
  }

  GestureDetector _buildSkipForward() {
    return GestureDetector(
      onTap: _skipForward,
      child: Container(
        height: 40,
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 6.0,
          right: 8.0,
        ),
        margin: const EdgeInsets.only(left: 10.0),
        child: const Icon(
          CupertinoIcons.goforward_15,
          color: ColorPalette.surface,
          size: 32.0,
        ),
      ),
    );
  }

  Widget _buildVideoDuration(VideoPlayerValue value) {
    EdgeInsets durationPadding = _chewieController!.isFullScreen
        ? const EdgeInsets.only(left: 16.0)
        : const EdgeInsets.only(left: 8.0);
    return Padding(
      padding: durationPadding,
      child: Text(
        "${StringUtils.formattedDuration(value.position)} / ${StringUtils.formattedDuration(value.duration)}",
        style: TextStyle(
          fontSize: 12,
          color: ColorPalette.primaryTextDark,
        ),
      ),
    );
  }

  GestureDetector _buildVideoFullscreen() {
    EdgeInsets fullscreenPadding = _chewieController!.isFullScreen
        ? const EdgeInsets.only(right: 16.0)
        : const EdgeInsets.only(right: 8.0);
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: Padding(
        padding: fullscreenPadding,
        child: const Icon(
          Icons.fullscreen,
          color: ColorPalette.surface,
          size: 24,
          // playing: controller.value.isPlaying,
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    EdgeInsets progressBarPadding = _chewieController!.isFullScreen
        ? const EdgeInsets.only(right: 20.0, left: 20.0)
        : const EdgeInsets.only(right: 8.0, left: 8.0);
    return Expanded(
      child: Padding(
        padding: progressBarPadding,
        child: CustomVideoProgressBar(
          _videoPlayerController,
          onDragStart: () {
            setState(() {
              dragging = true;
            });

            _hideTimer?.cancel();
          },
          onDragEnd: () {
            setState(() {
              dragging = false;
            });

            _startHideTimer();
          },
          colors: ProgressColors(
            playedColor: const Color.fromARGB(
              120,
              255,
              255,
              255,
            ),
            handleColor: const Color.fromARGB(
              255,
              255,
              255,
              255,
            ),
            bufferedColor: const Color.fromARGB(
              60,
              255,
              255,
              255,
            ),
            backgroundColor: const Color.fromARGB(
              20,
              255,
              255,
              255,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildMuteButton(VideoPlayerValue value) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (value.volume == 0) {
          _chewieController!.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = value.volume;
          _chewieController!.setVolume(0.0);
        }
      },
      child: Icon(
        value.volume > 0
            ? CupertinoIcons.speaker_2_fill
            : CupertinoIcons.speaker_slash_fill,
        color: Colors.black,
        size: 24,
      ),
    );
  }

  void _playPause() {
    final isFinished = _videoPlayerController.value.position >=
        _videoPlayerController.value.duration;

    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        hideControls.value = false;
        _hideTimer?.cancel();
        _videoPlayerController.pause();
        final double progress = _getVideoProgress();
        _updateVideoProgress(progress);
      } else {
        _cancelAndRestartTimer();

        if (!_videoPlayerController.value.isInitialized) {
          _videoPlayerController.initialize().then((_) {
            _videoPlayerController.play();
          });
        } else {
          if (isFinished) {
            _videoPlayerController.seekTo(Duration.zero);
          }
          _videoPlayerController.play();
        }
      }
    });
  }

  void _skipBack() {
    _cancelAndRestartTimer();
    final beginning = Duration.zero.inMilliseconds;
    final skip =
        (_videoPlayerController.value.position - const Duration(seconds: 15))
            .inMilliseconds;
    _videoPlayerController
        .seekTo(Duration(milliseconds: math.max(skip, beginning)));
  }

  void _skipForward() {
    _cancelAndRestartTimer();
    final end = _videoPlayerController.value.duration.inMilliseconds;
    final skip =
        (_videoPlayerController.value.position + const Duration(seconds: 15))
            .inMilliseconds;
    _videoPlayerController.seekTo(Duration(milliseconds: math.min(skip, end)));
  }

  void _checkVideoProgress() {
    if (widget.video.completed) {
      return;
    }
    if (_videoPlayerController.value.isInitialized) {
      int position = _videoPlayerController.value.position.inMilliseconds;
      int duration = _videoPlayerController.value.duration.inMilliseconds;
      final double progress = _getVideoProgress();
      if (position < duration) {
        if (progress > 0.0) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(seconds: 30),
              () => _updateVideoProgress(progress));
        }
      } else if (position == duration) {
        _updateVideoProgress(progress);
      }
    }
  }

  _updateVideoProgress(double progress) {
    // _videoService.updateVideoProgress(progress);
  }

  double _getVideoProgress() {
    int position = _videoPlayerController.value.position.inMilliseconds;
    int duration = _videoPlayerController.value.duration.inMilliseconds;
    final double playedPartPercent = position / duration;
    final double progress = double.parse(playedPartPercent.toStringAsFixed(1));
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? SafeArea(
            top: !_chewieController!.isFullScreen ? false : true,
            child: _chewiePlayer,
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
