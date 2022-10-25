import 'package:flutter/material.dart';
import 'package:travel_planner/presentation/design/ui_helpers.dart';

import '../../design/color_pallete.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.showLoading = false,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final bool showLoading;
  final IconData iconData;

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
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textButtonTheme
                            .style
                            ?.textStyle
                            ?.resolve(MaterialState.values.toSet()),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    Icon(
                      iconData,
                      size: 24,
                      color: ColorPalette.surface,
                    )
                  ],
                )
              : CircularProgressIndicator(
                  color: ColorPalette.onPrimary.withOpacity(0.5),
                ),
        ),
      ),
    );
  }
}
