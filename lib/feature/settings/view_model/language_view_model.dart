import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/_core_exports.dart';
import 'package:weather/core/constants/localization/language_locale_code_enum.dart';
import 'package:weather/feature/settings/model/language_model.dart';

class LanguageViewModel with ChangeNotifier {
  void selectLanguage(int index, BuildContext context) {
    for (var element in languageList) {
      element.isActive = false;
    }
    languageList[index].isActive = true;

    context.setLocale(languageList[index].locale);
  }

  List<LanguageCodeModel> languageList = [
    LanguageCodeModel(
      assetName: AssetPaths().turkeyFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.tr).languageCode,
    ),
    LanguageCodeModel(
      assetName: AssetPaths().unitedStatesFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.en).languageCode,
    ),
    LanguageCodeModel(
      assetName: AssetPaths().germanyFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.de).languageCode,
    ),
    LanguageCodeModel(
      assetName: AssetPaths().spainFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.es).languageCode,
    ),
    LanguageCodeModel(
      assetName: AssetPaths().franceFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.fr).languageCode,
    ),
    LanguageCodeModel(
      assetName: AssetPaths().italyFlag,
      locale: LanguageCodeExtension(LanguageCodeEnum.it).languageCode,
    ),
  ];
}
