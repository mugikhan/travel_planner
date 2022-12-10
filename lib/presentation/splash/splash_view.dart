import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:simple_animations/simple_animations.dart';

import 'splash_viewmodel.dart';

enum AniProps { yPosition, opacity }

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) {
        final MovieTween tween = MovieTween()
          ..scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 750),
          ).tween(
            AniProps.yPosition,
            Tween(
              begin: (MediaQuery.of(context).size.height / 2) - 40,
              end: (MediaQuery.of(context).size.height / 2),
            ),
            curve: Curves.easeInOut,
          )
          ..scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 750),
          ).tween(
            AniProps.opacity,
            Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeInOut,
          );
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/aerial_2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              PlayAnimationBuilder<Movie>(
                tween: tween,
                duration: tween.duration,
                builder: (context, value, child) {
                  return Positioned(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    top: value.get(AniProps.yPosition),
                    child: Opacity(
                      opacity: value.get(AniProps.opacity),
                      child: const Image(
                        image: AssetImage('assets/logo_transparent.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
                onCompleted: () async {
                  await viewModel.navigateToLoginView();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
