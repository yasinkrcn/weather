// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/_core_exports.dart';
import 'package:weather/feature/home/view/page/home_page.dart';
import 'package:weather/feature/search/view/page/search_page.dart';

import 'package:weather/feature/settings/view/page/settings_page.dart';

enum BottomNavigationBarState { HOME, SEARCH, SETTINGS }

extension BottomNavigationBarStateExtension on BottomNavigationBarState {
  int stateToPageIndex() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 0;
      case BottomNavigationBarState.SEARCH:
        return 1;
      case BottomNavigationBarState.SETTINGS:
        return 2;
    }
  }

  BottomNavigationBarState indexToState(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return BottomNavigationBarState.HOME;
      case 1:
        return BottomNavigationBarState.SEARCH;
      case 2:
        return BottomNavigationBarState.SETTINGS;

      default:
        return BottomNavigationBarState.HOME;
    }
  }

  Color stateToActiveColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
      case BottomNavigationBarState.SEARCH:
      case BottomNavigationBarState.SETTINGS:
        return AppColors.white;
    }
  }

  String stateToAssetPath() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AssetPaths().home;
      case BottomNavigationBarState.SEARCH:
        return AssetPaths().search;

      case BottomNavigationBarState.SETTINGS:
        return AssetPaths().settings;
    }
  }

  double stateToAssetPathSize() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 28.h;
      case BottomNavigationBarState.SEARCH:
        return 28.h;

      case BottomNavigationBarState.SETTINGS:
        return 28.h;
    }
  }

  String stateToTitle() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return LangCode().home.tr();
      case BottomNavigationBarState.SEARCH:
        return LangCode().search.tr();
      case BottomNavigationBarState.SETTINGS:
        return LangCode().settings.tr();
    }
  }

  Widget buildBody() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return const HomePage();
      case BottomNavigationBarState.SEARCH:
        return const SearchPage();
      case BottomNavigationBarState.SETTINGS:
        return const SettingsPage();
    }
  }

  Color pageBackGroundColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return Colors.blue;
      case BottomNavigationBarState.SEARCH:
        return Colors.blue;
      case BottomNavigationBarState.SETTINGS:
        return Colors.blue;
    }
  }
}
