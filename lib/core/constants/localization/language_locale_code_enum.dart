import 'dart:ui';

enum LanguageCodeEnum {
  tr,
  en,
  de,
  fr,
  it,
  es,
}

extension LanguageCodeExtension on LanguageCodeEnum {
  Locale get languageCode {
    switch (this) {
      case LanguageCodeEnum.tr:
        return const Locale("tr", "TR");

      case LanguageCodeEnum.en:
        return const Locale("en", "US");

      case LanguageCodeEnum.de:
        return const Locale("de", "DE");

      case LanguageCodeEnum.fr:
        return const Locale("fr", "FR");

      case LanguageCodeEnum.it:
        return const Locale("it", "IT");

      case LanguageCodeEnum.es:
        return const Locale("es", "ES");
    }
  }
}
