import 'package:weather/core/extension/timestamp_day_to_hours_and_minute_extension.dart';
import 'package:weather/feature/home/view/widgets/weather_icon.dart';
import 'package:weather/feature/home/view_model/home_view_model.dart';

import '../../../../core/_core_exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Consumer(
      builder: (context, HomeViewModel homeViewModel, child) {
        return AppScaffold(
          body: AppWidgetBuilderByState(
            response: homeViewModel.weatherData,
            builder: (weather) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade200,
                      Colors.blue.shade400,
                      Colors.blue.shade600,
                      Colors.blue.shade800,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppText(
                                "${weather.main?.temp.toString().substring(0, 2)}°",
                                style: TextStyle(fontSize: 64, color: AppColors.white, fontWeight: FontWeight.w500),
                              ),
                              WeatherIcon(
                                iconCode: weather.weather![0].icon!,
                              )
                            ],
                          ),
                          AppText(
                            "${weather.weather?[0].description}",
                            style: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500),
                          ),
                          AppSizedBox.h(16),
                          AppText(
                            "${weather.name}",
                            style: TextStyle(fontSize: 28, color: AppColors.white, fontWeight: FontWeight.w500),
                          ),
                          AppSizedBox.h(16),
                          AppText(
                            "Gün Doğumu  ${IntToFormattedTime(weather.sys!.sunrise!).toFormattedTime()}",
                            style: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500),
                          ),
                          AppText(
                            "Gün Batımı  ${IntToFormattedTime(weather.sys!.sunset!).toFormattedTime()}",
                            style: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500),
                          ),
                          AppText(
                            "Güncelleme Tarihi  ${IntToFormattedTime(weather.dt!).toFormattedTime()}",
                            style: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: deneme.length,
                        itemBuilder: (context, index) {
                          return deneme[index];
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

List<Widget> deneme = [
  Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.sunny),
        AppText("Rüzgar"),
        AppText("54"),
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.heat_pump),
        AppText("Nem"),
        AppText("54"),
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.sunny),
        AppText("Rüzgar"),
        AppText("54"),
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.sunny),
        AppText("Rüzgar"),
        AppText("54"),
      ],
    ),
  ),
];
