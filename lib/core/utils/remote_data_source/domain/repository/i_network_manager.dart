import 'package:weather/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../error/failure/failure.dart';

abstract class INetworkManager {
  final Dio dio;

  INetworkManager(this.dio);

  Future<Either<Failure, String>> baseGet({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
  });
}
