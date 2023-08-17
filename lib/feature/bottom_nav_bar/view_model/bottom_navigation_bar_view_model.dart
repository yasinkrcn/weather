import 'package:flutter/rendering.dart';
import 'package:weather/feature/bottom_nav_bar/domain/entities/bottom_navigation_bar_state.dart';
import 'package:weather/feature/bottom_nav_bar/domain/repo/bottom_navigation_info_repository.dart';

import '../../../core/_core_exports.dart';

class BottomNavBarViewModel extends ChangeNotifier implements BottomNavigationInfoRepository {
  BottomNavigationBarState selectedBarState = BottomNavigationBarState.HOME;
  bool _isBottomBarVisible = true;
  bool isAppbarVisible = true;

  double scrollingPixel = 0.0;
  double _startPixel = 0.0;

  double _scrollingReversePixel = 0.0;
  double _startReversePixel = 0.0;

  void showBottomBar() {
    if (!_isBottomBarVisible) {
      _isBottomBarVisible = true;
      isAppbarVisible = true;
      _startPixel = 0.0;
      scrollingPixel = 0.0;
      notifyListeners();
    }
  }

  void hideBottomBar() {
    if (_isBottomBarVisible) {
      _isBottomBarVisible = false;
      notifyListeners();
    }
  }

  void scrollDown(double pixel) {
    _startReversePixel = 0.0;
    _scrollingReversePixel = 0.0;
    if (scrollingPixel == 0.0) {
      _startPixel = pixel;
      scrollingPixel = 1;
    } else {
      scrollingPixel = pixel - _startPixel;
      if (scrollingPixel >= 93.0) {
        scrollingPixel = 95.0;
      }
      if (scrollingPixel == 95.0) {
        hideBottomBar();
      }
    }
  }

  void scrollUp(double pixel) {
    if (_startReversePixel == 0.0) {
      _startReversePixel = pixel;
    } else {
      _scrollingReversePixel = _startReversePixel - pixel;
      if (_scrollingReversePixel >= 10) {
        _startPixel = 0.0;
        scrollingPixel = 0.0;
        showBottomBar();
      }
    }
  }

  void directionScroll({
    required ScrollController scrollController,
  }) {
    if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      //yukarı kaydırma

      scrollUp(scrollController.position.pixels);
    }
    if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      //aşağı kaydırma

      scrollDown(scrollController.position.pixels);
    }
  }

  set setBottomBarVisible(bool value) {
    _isBottomBarVisible = value;
    notifyListeners();
  }

  bool get isBottomBarVisible => _isBottomBarVisible;

  @override
  void routePage(BottomNavigationBarState pageState) {
    if (selectedBarState != pageState) {
      selectedBarState = pageState;
      notifyListeners();
    }
  }
}
