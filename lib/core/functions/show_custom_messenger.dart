// ignore_for_file: constant_identifier_names

import 'package:weather/core/_core_exports.dart';

enum CustomMessengerState {
  SUCCESS,
  INFO,
  WARNING,
  ERROR,
}

extension CustomMessengerHelper on CustomMessengerState {
  Color getColor() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Colors.green;
      case CustomMessengerState.INFO:
        return Colors.blue;
      case CustomMessengerState.WARNING:
        return Colors.orange;
      case CustomMessengerState.ERROR:
        return Colors.red;
    }
  }

  Color getIconColor() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Colors.white;
      case CustomMessengerState.INFO:
        return Colors.white;
      case CustomMessengerState.WARNING:
        return Colors.white;
      case CustomMessengerState.ERROR:
        return Colors.white;
    }
  }

  Color getTextColor() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Colors.white;
      case CustomMessengerState.INFO:
        return Colors.white;
      case CustomMessengerState.WARNING:
        return Colors.white;
      case CustomMessengerState.ERROR:
        return Colors.white;
    }
  }

  IconData getIcon() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Icons.check_circle;
      case CustomMessengerState.INFO:
        return Icons.warning_rounded;
      case CustomMessengerState.WARNING:
        return Icons.warning_rounded;
      case CustomMessengerState.ERROR:
        return Icons.warning_rounded;
    }
  }
}

void showCustomMessenger(CustomMessengerState messengerState, String content, {bool isTopSnackBar = false}) {
  ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).showSnackBar(
    SnackBar(
      margin: EdgeInsets.only(bottom: isTopSnackBar ? ScreenSize().getHeightPercent(.80) : 24),
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.horizontal,
      content: CustomMessenger(state: messengerState, content: content),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      elevation: 0,
    ),
  );
}
