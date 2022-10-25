import 'package:flutter/material.dart';

class TextUtils {
  static bool hasTextOverflow(
    String text,
    TextStyle style, {
    double minWidth = 0,
    double maxWidth = double.infinity,
    int maxLines = 1,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  static String getInitials(String title) {
    String firstLetters = title.split(" ").map((word) => word[0]).join('');
    return firstLetters;
  }
}
