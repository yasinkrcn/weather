extension IntToFormattedTime on int {
  String toFormattedTime() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
