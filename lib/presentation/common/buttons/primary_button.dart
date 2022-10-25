import 'package:flutter/material.dart';

import '../../design/color_pallete.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.showLoading = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: showLoading,
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !showLoading
              ? Text(
                  title,
                  style: Theme.of(context)
                      .textButtonTheme
                      .style
                      ?.textStyle
                      ?.resolve(MaterialState.values.toSet()),
                )
              : CircularProgressIndicator(
                  color: ColorPalette.onPrimary.withOpacity(0.5),
                ),
        ),
      ),
    );
  }
}
