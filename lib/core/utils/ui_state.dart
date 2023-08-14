class UIState<T> {
  late UIStateStatus status;
  T? data;
  String? message;
  UIState.idle() : status = UIStateStatus.idle;
  UIState.loading() : status = UIStateStatus.loading;
  UIState.success(this.data) : status = UIStateStatus.success;
  UIState.error(this.message) : status = UIStateStatus.error;

  bool get isIdle => status == UIStateStatus.idle;
  bool get isLoading => status == UIStateStatus.loading;
  bool get isSuccess => status == UIStateStatus.success;
  bool get isError => status == UIStateStatus.error;
}

enum UIStateStatus { idle, loading, success, error }


// class UIState<T> {
//   late UIStateStatus status;
//   T? data;
//   String? message;
//   UIState.idle() : status = UIStateStatus.idle;
//   UIState.loading() : status = UIStateStatus.loading;
//   UIState.success(this.data) : status = UIStateStatus.success;
//   UIState.error(this.message) {
//     status = UIStateStatus.error;
//     showCustomMessenger(CustomMessengerState.ERROR, message ?? "");
//   }

//   bool get isIdle => status == UIStateStatus.idle;
//   bool get isLoading => status == UIStateStatus.loading;
//   bool get isSuccess => status == UIStateStatus.success;
//   bool get isError => status == UIStateStatus.error;
// }
