extension DateTimeExtensionsToTurkish on DateTime {
  String toFormattedStringOnDateTime() {
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

    final day = this.day;
    final month = months[this.month - 1];
    final year = this.year;
    final weekDay = weekDays[weekday - 1];

    return '$day $month $weekDay $year';
  }
}
