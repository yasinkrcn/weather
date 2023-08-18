import 'package:easy_localization/easy_localization.dart';

import '../../../../core/_core_exports.dart';

class WeatherOtherThings extends StatelessWidget {
  final String text;
  final String asset;
  final String? info;
  const WeatherOtherThings({
    super.key,
    required this.text,
    required this.asset,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white.withOpacity(.6), borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            asset,
            height: 56.h,
          ),
          AppText(
            context.tr(text),
            textAlign: TextAlign.center,
            style: AppTextStyles.medium16W500,
          ),
          AppText(
            info ?? "",
            style: AppTextStyles.medium18W500,
          ),
        ],
      ),
    );
  }
}
