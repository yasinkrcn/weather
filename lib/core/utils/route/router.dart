import 'package:flutter/cupertino.dart';
import 'package:weather/feature/home/view/page/home_page.dart';

class PageRoutes {
  // Authentication
  static const String splashPage = "/splashPage";
  static const String homePage = "/homePage";

  // Home
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return CupertinoPageRoute(builder: (_) => const HomePage());
  }
}
