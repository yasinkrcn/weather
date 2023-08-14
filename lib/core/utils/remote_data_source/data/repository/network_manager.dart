import 'package:weather/core/entities/response_model.dart';
import 'package:weather/core/error/failure/failure.dart';
import 'package:weather/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import 'package:weather/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:dartz/dartz.dart';
import '../../../../_core_exports.dart';
import '../../../../error/failure/network_failure.dart';

class NetworkManager extends INetworkManager {
  NetworkManager(super.dio);

  @override
  Future<Either<Failure, String>> baseGet({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _errorHandler(
      dio.get(
        endPoint.path,
        queryParameters: queryParameters,
        options: Options(),
      ),
    );
  }

  Future<Either<Failure, String>> _errorHandler(Future<Response> requestFunction) async {
    Response response;
    try {
      response = await requestFunction;
    } on SocketException {
      return Left(NoInternetConnectionFailure());
    }

    return _handleResponse(response);
  }

  Either<Failure, String> _handleResponse(Response response) {
    Failure result = ServiceFailure();
    result.errorMessage = ResponseModel.fromJson(response.data).message;
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.accepted:
      case HttpStatus.noContent:
        return Right(response.data);
      case HttpStatus.badRequest:
        return Left(result);
      case HttpStatus.unauthorized:
        return Left(result);
      case HttpStatus.forbidden:
        return Left(ForbiddenFailure());
      case HttpStatus.notFound:
        return Left(NotFoundFailure());
      case HttpStatus.unprocessableEntity:
        return Left(result);
      case HttpStatus.internalServerError:
        return Left(InternalFailure());
      case HttpStatus.gatewayTimeout:
        return Left(GatewayTimeOutFailure());
      default:
        return Left(NotFoundFailure());
    }
  }
}
