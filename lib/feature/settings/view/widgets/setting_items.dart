import '../../../../core/_core_exports.dart';

class SettingsItems extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SettingsItems({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.white.withOpacity(.6)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text,
                style: AppTextStyles.medium18W500White,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
