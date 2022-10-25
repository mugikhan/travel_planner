import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_progress_bar.dart';

class CustomVideoProgressBar extends StatelessWidget {
  CustomVideoProgressBar(
    this.controller, {
    ProgressColors? colors,
    this.onDragEnd,
    this.onDragStart,
    this.onDragUpdate,
    Key? key,
  })  : colors = colors ?? ProgressColors(),
        super(key: key);

  final VideoPlayerController controller;
  final ProgressColors colors;
  final Function()? onDragStart;
  final Function()? onDragEnd;
  final Function()? onDragUpdate;

  @override
  Widget build(BuildContext context) {
    return VideoProgressBar(
      controller,
      barHeight: 5,
      handleHeight: 6,
      drawShadow: true,
      colors: colors,
      onDragEnd: onDragEnd,
      onDragStart: onDragStart,
      onDragUpdate: onDragUpdate,
    );
  }
}
