import '../_core_exports.dart';

class AppSizedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const AppSizedBox._({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  factory AppSizedBox.w(
    double width, {
    Widget? child,
  }) {
    return AppSizedBox._(
      width: width,
      child: child,
    );
  }

  factory AppSizedBox.h(
    double height, {
    Widget? child,
  }) {
    return AppSizedBox._(
      height: height,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
      child: child,
    );
  }
}
