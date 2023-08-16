import 'package:weather/core/extension/timestamp_day_to_hours_and_minute_extension.dart';
import 'package:weather/feature/home/view_model/home_view_model.dart';

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
            text,
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

List<Widget> otherWeatherInfos = [
  WeatherOtherThings(
    asset: AssetPaths().humidity,
    text: "Nem",
    info:
        "%${Provider.of<HomeViewModel>(GlobalContextKey.instance.globalKey.currentState!.context).weatherData.data?.main!.humidity}",
  ),
  WeatherOtherThings(
    asset: AssetPaths().windy,
    text: "Rüzgar",
    info:
        "${Provider.of<HomeViewModel>(GlobalContextKey.instance.globalKey.currentState!.context).weatherData.data?.wind?.speed} km/s",
  ),
  WeatherOtherThings(
      asset: AssetPaths().sunrise,
      text: "Gün\nDoğumu",
      info: IntToFormattedTime(Provider.of<HomeViewModel>(GlobalContextKey.instance.globalKey.currentState!.context)
              .weatherData
              .data!
              .sys!
              .sunrise!)
          .toFormattedTime()),
  WeatherOtherThings(
    asset: AssetPaths().sunset,
    text: "Gün\nBatımı",
    info: IntToFormattedTime(Provider.of<HomeViewModel>(GlobalContextKey.instance.globalKey.currentState!.context)
            .weatherData
            .data!
            .sys!
            .sunset!)
        .toFormattedTime(),
  ),
];
