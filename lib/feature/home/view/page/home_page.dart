import 'package:easy_localization/easy_localization.dart';
import 'package:weather/feature/home/view/widgets/shimmer_loading.dart';
import 'package:weather/feature/home/view/widgets/weather_other_things.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    sl<HomeViewModel>().initScrollController();
  }

  @override
  void dispose() {
    sl<HomeViewModel>().disposeScrollController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);

    return Consumer(
      builder: (context, HomeViewModel homeViewModel, child) {
        return AppScaffold(
          body: RefreshIndicator(
            onRefresh: homeViewModel.refreshPage,
            child: AppBackground(
              child: SingleChildScrollView(
                controller: homeViewModel.scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AppWidgetBuilderByState(
                      response: homeViewModel.weatherData,
                      loadingWidget: const ShimmerLoading(),
                      builder: (weather) {
                        return Padding(
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
                                        style: const TextStyle(
                                            fontSize: 64, color: AppColors.white, fontWeight: FontWeight.w500),
                                      ),
                                      WeatherIcon(
                                        iconCode: weather.weather![0].icon!,
                                      )
                                    ],
                                  ),
                                  AppText(
                                    "${weather.weather?[0].description}",
                                    style: const TextStyle(
                                        fontSize: 30, color: AppColors.white, fontWeight: FontWeight.w500),
                                  ),
                                  AppSizedBox.h(16),
                                  AppText(
                                    "${weather.name}",
                                    style: const TextStyle(
                                        fontSize: 28, color: AppColors.white, fontWeight: FontWeight.w500),
                                  ),
                                  AppSizedBox.h(16),
                                  Row(
                                    children: [
                                      AppText(
                                        "${LangCode().updateTime.tr()} : ${IntToFormattedTime(weather.dt!).toFormattedTime()}",
                                        style: const TextStyle(
                                            fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w500),
                                      ),
                                      AppSizedBox.w(12),
                                      GestureDetector(
                                          onTap: () {
                                            homeViewModel.refreshPage();
                                          },
                                          child: const Icon(Icons.refresh_rounded))
                                    ],
                                  ),
                                ],
                              ),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.85),
                                itemCount: homeViewModel.weatherSpecifies(weather).length,
                                itemBuilder: (context, index) {
                                  var otherWeatherInfos = homeViewModel.weatherSpecifies(weather)[index];

                                  return WeatherOtherThings(
                                    asset: otherWeatherInfos.assetPath,
                                    text: otherWeatherInfos.text,
                                    info: otherWeatherInfos.description,
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    AppSizedBox.h(16),
                    AppWidgetBuilderByState(
                      response: homeViewModel.weatherHourlyData,
                      loadingWidget: const ShimmerLoading(),
                      builder: (hourlyData) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(.25),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hourlyData.list?.length,
                            itemBuilder: (context, index) {
                              var res = hourlyData.list ?? [];

                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppText(
                                      IntToFormattedTime(res[index].dt!).toFormattedTime(),
                                      style: AppTextStyles.medium16W500,
                                    ),
                                    WeatherIcon(
                                      size: 90,
                                      iconCode: res[index].weather![0].icon.toString(),
                                    ),
                                    AppText(
                                      "${res[index].main!.temp!.toString().substring(0, 2)}°",
                                      style: AppTextStyles.medium18W500,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    AppSizedBox.h(16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
