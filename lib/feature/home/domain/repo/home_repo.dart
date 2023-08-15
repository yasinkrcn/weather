import 'package:dartz/dartz.dart';
import 'package:weather/core/_core_exports.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherModel>> fetchWeatherInfo({required WeatherArguments weatherArguments});
  Future<Either<Failure, HourlyWeatherModel>> fetchHourlyWeatherDetail({required WeatherArguments weatherArguments});
}
