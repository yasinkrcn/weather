import 'package:dio/dio.dart';
import 'package:weather/core/constants/app_constants.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = "https://api.openweathermap.org/";

    dio.options.validateStatus = (_) => true;

    dio.options.headers = {
      "Accept": "application/json",
    };

    dio.options.queryParameters = {
      "appid": AppConstants.apiKey,
    };

    dio.options.responseType = ResponseType.plain;

    dio.interceptors.add(LogInterceptor(requestBody: true, error: true, responseBody: true));

    return dio;
  }
}
