import 'package:provider/single_child_widget.dart';
// import 'package:weather/feature/bottom_nav_bar/vie.dart';
import 'package:weather/feature/bottom_nav_bar/view_model/bottom_navigation_bar_view_model.dart';
import 'package:weather/feature/home/view_model/home_view_model.dart';
import '../_core_exports.dart';

class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider(create: (_) => sl<HomeViewModel>()),
    ChangeNotifierProvider(create: (_) => sl<BottomNavBarViewModel>()),
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
