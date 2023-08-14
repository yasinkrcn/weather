abstract class Failure {
  String errorMessage = "Hata";
}

//*Gerektikçe failure classları eklenecek...

class ServiceFailure implements Failure {
  @override
  String errorMessage = "ServiceFailure";
}

class NullPointerFailure implements Failure {
  @override
  String errorMessage = "Data equals null";
}

class NoInternetConnectionFailure implements Failure {
  @override
  String errorMessage = "Data equals null";
}
