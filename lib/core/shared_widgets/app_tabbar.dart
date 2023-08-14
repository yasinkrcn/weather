import 'package:flutter/material.dart';

import '../constants/theme/app_colors.dart';
import 'app_text.dart';

class AppTabbar extends StatelessWidget {
  final List<String> title;
  final List<String>? assetPath;
  final Widget child;
  final double? paddingLR;
  final double? paddingTB;
  final int tabCount;
  const AppTabbar(
      {super.key,
      required this.title,
      required this.child,
      this.assetPath,
      this.paddingLR,
      this.paddingTB,
      required this.tabCount});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabCount,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                left: paddingLR ?? 0,
                right: paddingLR ?? 0,
                top: paddingTB ?? 0,
                bottom: paddingTB ?? 0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.withPrimaryGrey,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                unselectedLabelColor: AppColors.blackVariantGrey,
                tabs: List.generate(
                  tabCount,
                  (index) => Tab(
                    icon: assetPath != null
                        ? assetPath![index] == ""
                            ? AppText(title[index])
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(title[index]),
                                  Image.asset(assetPath![index])
                                ],
                              )
                        : AppText(title[index]),
                  ),
                ),

                /*[
                    
                    Tab(
                      icon: assetPath1 == null
                          ? AppText(title1)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(title1),
                                Image.asset(assetPath1!)
                              ],
                            ),
                    ),
                  ]*/
              ),
            ),
          ),
          child
        ]));
  }
}
