import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../design/color_pallete.dart';

class Thumbnail extends StatelessWidget {
  Thumbnail({
    Key? key,
    required this.url,
    required this.onTap,
    this.height = 300,
  }) : super(key: key);

  final String url;
  final double? height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: ExtendedImage.network(
          url,
          fit: BoxFit.fill,
          cache: true,
          clearMemoryCacheIfFailed: true,
          clearMemoryCacheWhenDispose: true,
          loadStateChanged: (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                final ImageChunkEvent? loadingProgress = state.loadingProgress;
                final double? progress =
                    loadingProgress?.expectedTotalBytes != null
                        ? loadingProgress!.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null;
                return Center(
                  child: SizedBox.expand(
                    child: CircularPercentIndicator(
                      radius: 20.0,
                      lineWidth: 2.0,
                      animation: true,
                      animationDuration: 3000,
                      percent: progress ?? 0,
                      animateFromLastPercent: true,
                      center: Text(
                        '${((progress ?? 0.0) * 100).toInt()}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: ColorPalette.primary,
                    ),
                  ),
                );
              case LoadState.completed:
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: height! / 6,
                        width: height! / 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.tertiaryGrey,
                        ),
                        child: const Icon(Icons.play_arrow, size: 35.0),
                      ),
                    ),
                  ],
                );
              case LoadState.failed:
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/fallback_image.png",
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: height! / 6,
                        width: height! / 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.tertiaryGrey,
                        ),
                        child: const Icon(Icons.play_arrow, size: 35.0),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}

class DefaultThumbnail extends StatelessWidget {
  const DefaultThumbnail({
    Key? key,
    this.height = 300,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/fallback_image.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height! / 6,
              width: height! / 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.tertiaryGrey,
              ),
              child: const Icon(Icons.play_arrow, size: 35.0),
            ),
          ),
        ],
      ),
    );
  }
}
