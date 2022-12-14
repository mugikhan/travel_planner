import 'package:flutter/material.dart';

import '../../design/color_pallete.dart';

class SecondaryTextButton extends StatelessWidget {
  const SecondaryTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style?.copyWith(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorPalette.secondary)),
        child: Text(
          title,
          style: Theme.of(context)
              .textButtonTheme
              .style
              ?.textStyle
              ?.resolve(MaterialState.values.toSet()),
        ));
  }
}
