extension TimestampExtension on DateTime {
  int toTimestamp() {
    return millisecondsSinceEpoch ~/ 1000;
  }

  static DateTime fromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }
}
