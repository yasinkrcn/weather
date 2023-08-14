import '../_core_exports.dart';

class PageTopInfoCard extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const PageTopInfoCard({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 115.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF06151A),
          Color(0xFF2E5F77),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title ?? "",
            style: AppTextStyles.medium18W500.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 8.h),
          Visibility(
            visible: subTitle != null,
            child: AppText(
              subTitle ?? "",
              style: AppTextStyles.medium18W500.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
