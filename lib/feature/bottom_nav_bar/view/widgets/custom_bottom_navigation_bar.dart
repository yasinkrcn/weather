// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:weather/feature/bottom_nav_bar/_bottom_navigation_bar_exports.dart';

import '../../../../core/_core_exports.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Consumer(
      builder: (BuildContext context, BottomNavBarViewModel provider, Widget? widget) {
        return AnimatedContainer(
          height: provider.isBottomBarVisible ? 70.h : 0,
          width: ScreenSize().getWidth(1),
          curve: Curves.linear,
          duration: const Duration(
            milliseconds: 2500,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (BottomNavigationBarState state in BottomNavigationBarState.values)
                CustomBottomNavigationBarItem(
                  onTap: () {
                    provider.routePage(state);
                  },
                  isActive: provider.selectedBarState == state,
                  barState: state,
                ),
            ],
          ),
        );
      },
    );
  }
}
