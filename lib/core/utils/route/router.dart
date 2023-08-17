import 'package:flutter/cupertino.dart';
import 'package:weather/feature/home/view/page/home_page.dart';
import 'package:weather/feature/search/view/page/search_page.dart';

class PageRoutes {
  // Authentication
  static const String splashPage = "/splashPage";
  static const String homePage = "/homePage";
  static const String searchPage = "/searchPage";

  // Home
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    case PageRoutes.searchPage:
      return CupertinoPageRoute(builder: (_) => const SearchPage());
    default:
      return CupertinoPageRoute(builder: (_) => const HomePage());
  }
}
