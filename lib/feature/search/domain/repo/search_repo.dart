import 'package:dartz/dartz.dart';
import 'package:weather/core/_core_exports.dart';

abstract class SearchRepository {
  Future<Either<Failure, WeatherModel>> searchLocation({required SearchArguments searchArguments});
}
