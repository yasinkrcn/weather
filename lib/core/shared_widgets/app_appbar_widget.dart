import '../_core_exports.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final String? title;

  const CommonAppBar({Key? key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: title == null
          ? Image.asset(
              AssetsPath().logoKing,
              height: 30,
              width: 30,
            )
          : Text(
              title!,
              style: const TextStyle(color: AppColors.black),
            ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.black),
      actions: [if (child != null) child!, AppSizedBox.w(10.w)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
