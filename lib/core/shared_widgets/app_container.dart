import 'package:weather/core/_core_exports.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().screenSize.height - ScreenSize().viewPaddingBottom - ScreenSize().viewPaddingTop,
      color: Colors.transparent,
      child: child,
    );
  }
}
