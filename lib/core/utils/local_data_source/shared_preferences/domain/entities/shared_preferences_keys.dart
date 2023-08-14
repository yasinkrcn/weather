// ignore_for_file: constant_identifier_names

enum SharedPreferencesKeys {
  LANGUAGE_SETTINGS,
  CACHE_USER_INFO,
  CACHE_ONBOARD_INFO,
  NOTIFICATION,

  CACHE_REFRESH_TOKEN,
}

extension SharedPreferencesKeysExtension on SharedPreferencesKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SharedPreferencesKeys.LANGUAGE_SETTINGS:
        return "LANGUAGE_SETTINGS";
      case SharedPreferencesKeys.CACHE_USER_INFO:
        return "CACHE_USER_INFO";

      case SharedPreferencesKeys.CACHE_ONBOARD_INFO:
        return "CACHE_ONBOARD_INFO";
      case SharedPreferencesKeys.NOTIFICATION:
        return "NOTIFICATION";

      case SharedPreferencesKeys.CACHE_REFRESH_TOKEN:
        return "CACHE_REFRESH_TOKEN";
    }
  }
}
