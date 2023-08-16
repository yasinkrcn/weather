import 'package:weather/feature/bottom_nav_bar/domain/entities/bottom_navigation_bar_state.dart';

abstract class BottomNavigationInfoRepository {
  void routePage(BottomNavigationBarState pageState);
}
