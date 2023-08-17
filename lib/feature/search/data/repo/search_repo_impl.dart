import 'package:dartz/dartz.dart';
import '../../../../core/_core_exports.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<Failure, WeatherModel>> searchLocation({required SearchArguments searchArguments}) async {
    try {
      final res = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.weather,
        queryParameters: searchArguments.toMap(),
      );

      return res.fold((l) => Left(l), (data) {
        final result = WeatherModel.fromJson(data);

        return Right(result);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
