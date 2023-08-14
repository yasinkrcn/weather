import 'package:flutter/material.dart';

import '../constants/app_asset_paths.dart';
import '../constants/theme/app_colors.dart';
import '../constants/theme/app_text_styles.dart';
import 'app_sized_box.dart';
import 'app_text.dart';

class StarCoin extends StatelessWidget {
  final int coins;
  final double? padding, margin;
  const StarCoin({super.key, required this.coins, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0),
      padding: EdgeInsets.all(padding ?? 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppColors.strokeGrey,
      ),
      child: Row(
        children: [
          AppSizedBox.w(5.0),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              AssetsPath().coin,
              fit: BoxFit.cover,
            ),
          ),
          AppSizedBox.w(5.0),
          AppText(
            coins.toString(),
            style: AppTextStyles.primary13W700,
          ),
          AppSizedBox.w(5.0),
        ],
      ),
    );
  }
}
