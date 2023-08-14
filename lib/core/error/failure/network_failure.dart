import 'package:weather/core/error/failure/failure.dart';

class BadRequestFailure implements Failure {
  @override
  String errorMessage = "BadRequestFailure";
}

class UnauthorizedFailure implements Failure {
  @override
  String errorMessage = "UnauthorizedFailure";
}

class ForbiddenFailure implements Failure {
  @override
  String errorMessage = "ForbiddenFailure";
}

class NotFoundFailure implements Failure {
  @override
  String errorMessage = "Not Found Failure";
}

class InternalFailure implements Failure {
  @override
  String errorMessage = "InternalFailure";
}

class GatewayTimeOutFailure implements Failure {
  @override
  String errorMessage = "GatewayTimeOutFailure";
}
