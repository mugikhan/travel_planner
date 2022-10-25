import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_planner/data/entities/video/video.dart';
import 'package:video_player/video_player.dart';

import '../../design/color_pallete.dart';
import '../utility/string_utils.dart';

class VideoDuration extends StatefulWidget {
  const VideoDuration({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  State<VideoDuration> createState() => _VideoDurationState();
}

class _VideoDurationState extends State<VideoDuration> {
  late VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.video.url);

    _videoPlayerController!.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController != null &&
            _videoPlayerController!.value.isInitialized
        ? Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Icon(
                  CupertinoIcons.clock,
                  size: 14,
                  color: ColorPalette.primary,
                ),
              ),
              Text(
                StringUtils.formattedDuration(
                  _videoPlayerController!.value.duration,
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primary,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          )
        : Container();
  }

  // String _formattedDuration(Duration duration) {
  //   return prettyDuration(
  //     anHour * duration.inHours +
  //         aMinute * duration.inMinutes +
  //         aMillisecond * duration.inMilliseconds,
  //     abbreviated: true,
  //     delimiter: ' ',
  //   );
  // }
}
