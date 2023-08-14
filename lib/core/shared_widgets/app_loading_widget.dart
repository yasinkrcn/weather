import '../_core_exports.dart';

class AppLoadingWidget extends StatelessWidget {
  final Widget? child;
  const AppLoadingWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child ?? const Center(child: CircularProgressIndicator.adaptive());
  }
}
