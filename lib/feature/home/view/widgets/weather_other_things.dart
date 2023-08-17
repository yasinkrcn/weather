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
    print(Provider.of<HomeViewModel>(context).weatherData.data?.main?.humidity);
    List<Widget> otherWeatherInfos = [
      weatherOtherThingsBoxOne(context),
      weatherOtherThingsBoxOne(context),
      weatherOtherThingsBoxOne(context),
      weatherOtherThingsBoxOne(context),
    ];
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

Widget weatherOtherThingsBoxOne(BuildContext context) {
  return WeatherOtherThings(
    asset: AssetPaths().humidity,
    text: "Nem",
    info: "%${Provider.of<HomeViewModel>(context).weatherData.data?.main?.humidity}",
  );
}

Widget weatherOtherThingsBoxTwo(BuildContext context) {
  return WeatherOtherThings(
    asset: AssetPaths().windy,
    text: "Rüzgar",
    info: "${Provider.of<HomeViewModel>(context).weatherData.data?.wind?.speed} km/s",
  );
}

Widget weatherOtherThingsBoxThree(BuildContext context) {
  return WeatherOtherThings(
      asset: AssetPaths().sunrise,
      text: "Gün\nDoğumu",
      info: IntToFormattedTime(Provider.of<HomeViewModel>(context).weatherData.data!.sys!.sunrise!).toFormattedTime());
}

Widget weatherOtherThingsBoxFour(BuildContext context) {
  return WeatherOtherThings(
    asset: AssetPaths().sunset,
    text: "Gün\nBatımı",
    info: IntToFormattedTime(Provider.of<HomeViewModel>(context).weatherData.data!.sys!.sunset!).toFormattedTime(),
  );
}
