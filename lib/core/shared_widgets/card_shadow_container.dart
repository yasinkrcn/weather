import '../_core_exports.dart';

class CardShadowContainer extends StatelessWidget {
  const CardShadowContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 352.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.strokeGrey),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 0,
                offset: const Offset(0, 0),
                color: AppColors.blurColor,
                blurStyle: BlurStyle.outer)
          ]),
      child: child,
    );
  }
}
