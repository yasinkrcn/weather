import '../../../core/_core_exports.dart';

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
        // showCustomMessenger(CustomMessengerState.ERROR, l.errorMessage);
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
        // showCustomMessenger(CustomMessengerState.ERROR, l.errorMessage);
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

  void disposeScrollController() {
    scrollController.dispose;
  }

  void scrollListener() {
    scrollController.addListener(() {
      previousScrollPosition = scrollController.position.pixels;

      // print(scrollController.position.pixels);
      sl<BottomNavBarViewModel>().directionScroll(scrollController: scrollController);
    });
  }

  // List<WeatherOtherDetailsModel> weatherOtherDetailList = [

  //   WeatherOtherDetailsModel(assetPath: AssetPaths().humidity, text: "Nem", description: "%${weatherData.data?.main?.humidity}",)
  // ];
}
