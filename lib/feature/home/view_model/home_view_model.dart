import 'package:weather/feature/home/domain/entities/arguments/weather_arguments.dart';

import '../../../core/_core_exports.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.homeRepo,
  }) {
    fetchLocationData();
  }

  HomeRepository homeRepo;

  WeatherArguments weatherArguments = WeatherArguments();

  UIState<WeatherModel> weatherData = UIState.idle();

  Future<void> fetchLocationData() async {
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
}
