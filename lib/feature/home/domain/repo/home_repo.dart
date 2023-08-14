import 'package:dartz/dartz.dart';
import 'package:weather/core/_core_exports.dart';
import 'package:weather/feature/home/domain/entities/arguments/weather_arguments.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherModel>> fetchWeatherInfo({required WeatherArguments weatherArguments});
}
