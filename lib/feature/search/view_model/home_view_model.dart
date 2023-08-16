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

  Future<void> fetchWeatherData() async {
    weatherData = UIState.loading();
    notifyListeners();
    try {
      final res = await homeRepo.fetchWeatherInfo(weatherArguments: WeatherArguments(q: "milas"));

      res.fold((l) {
        weatherData = UIState.error(l.errorMessage);
        notifyListeners();
        showCustomMessenger(CustomMessengerState.ERROR, l.errorMessage);
      }, (data) {
        weatherData = UIState.success(data);

        notifyListeners();
      });
    } catch (_) {}
  }

  UIState<HourlyWeatherModel> weatherHourlyData = UIState.idle();

  Future<void> fetchHourlyWeatherData() async {
    weatherHourlyData = UIState.loading();
    notifyListeners();
    try {
      final res = await homeRepo.fetchHourlyWeatherDetail(weatherArguments: WeatherArguments(q: "milas"));

      res.fold((l) {
        weatherHourlyData = UIState.error(l.errorMessage);
        notifyListeners();
        showCustomMessenger(CustomMessengerState.ERROR, l.errorMessage);
      }, (data) {
        weatherHourlyData = UIState.success(data);

        notifyListeners();
      });
    } catch (_) {}
  }

  Future<void> refreshPage() async {
    fetchWeatherData();
    fetchHourlyWeatherData();
  }
}
