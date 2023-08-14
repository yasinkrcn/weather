extension ShortNameExtension on String {
  String toNameCase() => replaceAllMapped(
      RegExp(r'(?<= |-|^).'),
      (match) => match[0]!
          .toUpperCase()); //Düzenlenecek tam olarak istenilen gibi çalışmıyor.
}
