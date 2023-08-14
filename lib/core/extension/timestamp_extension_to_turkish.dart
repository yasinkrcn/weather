extension TimeStampExtensionsToTurkish on int {
  String get toFormattedStringOnTimeStamp {
    final weekDays = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
    final months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık'
    ];

    final timeStamp = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final day = timeStamp.day;
    final month = months[timeStamp.month - 1];
    final year = timeStamp.year;
    final weekDay = weekDays[timeStamp.weekday - 1];

    return '$day $month $weekDay $year';
  }
}
