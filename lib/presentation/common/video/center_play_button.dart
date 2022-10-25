import 'package:flutter/material.dart';

import '../../design/color_pallete.dart';
import 'animated_play_pause.dart';

class CenterPlayButton extends StatelessWidget {
  const CenterPlayButton({
    Key? key,
    this.iconColor,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
  }) : super(key: key);

  final Color? iconColor;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: ColorPalette.surface, width: 2.0)),
          child: IconButton(
            iconSize: 28,
            padding: const EdgeInsets.all(2.0),
            icon: isFinished
                ? Icon(Icons.replay, color: iconColor)
                : AnimatedPlayPause(
                    color: iconColor,
                    playing: isPlaying,
                  ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
