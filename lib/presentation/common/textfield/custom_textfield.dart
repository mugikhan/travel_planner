import 'package:flutter/material.dart';

import '../../design/color_pallete.dart';

class TravelTextfield extends StatelessWidget {
  const TravelTextfield(
      {Key? key,
      required this.textEditingController,
      required this.focusNode,
      this.keyboardType = TextInputType.text,
      required this.hintText,
      this.maxWidth = double.infinity,
      this.obscureText = false})
      : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String hintText;
  final double maxWidth;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            enabled: true,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.tertiary)),
            hintText: hintText,
          ),
          controller: textEditingController,
          keyboardType: keyboardType,
          focusNode: focusNode,
          obscureText: obscureText,
        ));
  }
}
