import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/_core_exports.dart';
import 'package:weather/core/constants/localization/lang_code.dart';
import 'package:weather/feature/settings/view/widgets/logout_bottom_sheet.dart';
import 'package:weather/feature/settings/view/widgets/setting_items.dart';
import 'package:weather/feature/settings/view_model/language_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppScaffold(
      body: AppBackground(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: AppColors.white)),
                child: const Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: 72,
                )),
            AppSizedBox.h(16),
            Text(
              LangCode().username.tr(),
              style: AppTextStyles.medium18W500White,
            ),
            AppSizedBox.h(16),
            Consumer(
              builder: (context, LanguageViewModel languageViewModel, child) {
                return SettingsItems(
                  text: LangCode().language.tr(),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                  LangCode().selectLanguage.tr(),
                                  style: AppTextStyles.medium18W500,
                                ),
                                AppSizedBox.h(36),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 36,
                                    crossAxisSpacing: 36,
                                  ),
                                  itemCount: languageViewModel.languageList.length,
                                  itemBuilder: (context, index) {
                                    var languages = languageViewModel.languageList[index];
                                    return CountryFlagItem(
                                      onTap: () => languageViewModel.selectLanguage(index, context),
                                      flagAsset: languages.assetName,
                                      locale: languages.locale,
                                      isActive: languages.isActive,
                                    );
                                  },
                                ),
                                AppSizedBox.h(16),
                                AppButton.standart(onTap: () => Go.to.back(), buttonText: LangCode().continues.tr())
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            SettingsItems(
              text: LangCode().logout.tr(),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogOutBottomSheet();
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}

class CountryFlagItem extends StatelessWidget {
  final String flagAsset;
  final bool isActive;
  final Locale locale;
  final void Function()? onTap;
  const CountryFlagItem({
    Key? key,
    required this.flagAsset,
    required this.isActive,
    required this.locale,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 8, color: isActive ? Colors.orange : AppColors.transparent),
            shape: BoxShape.circle,
          ),
          child: Image.asset(flagAsset)),
    );
  }
}
