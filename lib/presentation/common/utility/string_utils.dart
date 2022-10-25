class StringUtils {
  static String formattedDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String? twoDigitMinutes =
        twoDigits(duration.inMinutes.remainder(60)) != "00"
            ? twoDigits(duration.inMinutes.remainder(60))
            : null;
    String? twoDigitHours = twoDigits(duration.inHours) != "00"
        ? twoDigits(duration.inHours)
        : null;
    if (twoDigitHours != null && twoDigitMinutes != null) {
      return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
    } else if (twoDigitHours == null && twoDigitMinutes != null) {
      return "$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "00:$twoDigitSeconds";
    }
  }
}
