// import 'package:dartz/dartz.dart';
// import '../../../../core/_core_exports.dart';

// class HomeRepositoryImpl implements HomeRepository {
//   @override
//   Future<Either<Failure, WeatherModel>> fetchWeatherInfo({
//     required WeatherArguments weatherArguments,
//   }) async {
//     try {
//       final res = await sl<INetworkManager>().baseGet(
//         endPoint: MainEndpoints.weather,
//         queryParameters: weatherArguments.toMap(),
//       );

//       return res.fold((l) => Left(l), (data) {
//         final result = WeatherModel.fromJson(data);

//         return Right(result);
//       });
//     } on Failure catch (failure) {
//       return Left(failure);
//     }
//   }

//   @override
//   Future<Either<Failure, HourlyWeatherModel>> fetchHourlyWeatherDetail(
//       {required WeatherArguments weatherArguments}) async {
//     try {
//       final res = await sl<INetworkManager>().baseGet(
//         endPoint: MainEndpoints.forecast,
//         queryParameters: weatherArguments.toMap(),
//       );

//       return res.fold((l) => Left(l), (data) {
//         final result = HourlyWeatherModel.fromJson(data);

//         return Right(result);
//       });
//     } on Failure catch (failure) {
//       return Left(failure);
//     }
//   }
// }
