import 'package:easy_localization/easy_localization.dart';

import '../../../../core/_core_exports.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(LangCode().doYouWantToExitTheApplication.tr(), style: AppTextStyles.medium20W600),
          AppSizedBox.h(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton.small(
                buttonText: LangCode().yes.tr(),
                onTap: () {
                  // sl<ProfileViewModel>().logOut();
                },
              ),
              AppButton.smallOutline(
                buttonText: LangCode().no.tr(),
                onTap: () => Go.to.back(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
