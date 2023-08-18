import '../../../core/_core_exports.dart';
import '../domain/entities/weather_other_details_model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.homeRepo,
  }) {
    fetchWeatherData();
    fetchHourlyWeatherData();
  }

  HomeRepository homeRepo;

  WeatherArguments weatherArguments = WeatherArguments();

  UIState<WeatherModel> weatherData = UIState.idle();

  Future<void> fetchWeatherData({String? query}) async {
    weatherData = UIState.loading();
    notifyListeners();
    try {
      final res = await homeRepo.fetchWeatherInfo(weatherArguments: WeatherArguments(q: query ?? "milas"));

      res.fold((l) {
        weatherData = UIState.error(l.errorMessage);
        notifyListeners();
      }, (data) {
        weatherData = UIState.success(data);

        notifyListeners();
      });
    } catch (_) {}
  }

  UIState<HourlyWeatherModel> weatherHourlyData = UIState.idle();

  Future<void> fetchHourlyWeatherData({String? query}) async {
    weatherHourlyData = UIState.loading();
    notifyListeners();
    try {
      final res = await homeRepo.fetchHourlyWeatherDetail(weatherArguments: WeatherArguments(q: query ?? "milas"));

      res.fold((l) {
        weatherHourlyData = UIState.error(l.errorMessage);
        notifyListeners();
      }, (data) {
        weatherHourlyData = UIState.success(data);

        notifyListeners();
      });
    } catch (_) {}
  }

  Future<void> refreshPage({String? query}) async {
    fetchWeatherData(query: query);
    fetchHourlyWeatherData(query: query);
  }

  late ScrollController scrollController;

  double previousScrollPosition = 0;

  void initScrollController() {
    scrollController = ScrollController(initialScrollOffset: previousScrollPosition);

    scrollListener();
  }

  void disposeScrollController() {
    scrollController.dispose;
  }

  void scrollListener() {
    scrollController.addListener(() {
      previousScrollPosition = scrollController.position.pixels;

      sl<BottomNavBarViewModel>().directionScroll(scrollController: scrollController);
    });
  }

  List<WeatherOtherDetailsModel> weatherSpecifies(WeatherModel weatherData) {
    return [
      WeatherOtherDetailsModel(
        assetPath: AssetPaths().humidity,
        text: LangCode().humidity,
        description: "%${weatherData.main?.humidity}",
      ),
      WeatherOtherDetailsModel(
        assetPath: AssetPaths().windy,
        text: LangCode().wind,
        description: "${weatherData.wind?.speed} km/s",
      ),
      WeatherOtherDetailsModel(
          assetPath: AssetPaths().sunrise,
          text: LangCode().sunrise,
          description: IntToFormattedTime(weatherData.sys!.sunrise!).toFormattedTime()),
      WeatherOtherDetailsModel(
        assetPath: AssetPaths().sunset,
        text: LangCode().sunset,
        description: IntToFormattedTime(weatherData.sys!.sunset!).toFormattedTime(),
      ),
    ];
  }
}
