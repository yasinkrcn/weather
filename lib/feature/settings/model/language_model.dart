import '../../../core/_core_exports.dart';

class LanguageCodeModel {
  final String assetName;
  final Locale locale;
  bool isActive;
  LanguageCodeModel({
    required this.assetName,
    required this.locale,
    this.isActive = false,
  });
}
