import 'package:flutter/material.dart';
import '../utils/ui_state.dart';

class AppWidgetBuilderByState<T> extends StatelessWidget {
  const AppWidgetBuilderByState({
    Key? key,
    required this.response,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);
  final UIState<T> response;
  final Function(T) builder;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    switch (response.status) {
      case UIStateStatus.idle:
        return idleWidget ?? const SizedBox.shrink();
      case UIStateStatus.loading:
        return Center(
            child: loadingWidget ??
                const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ));
      case UIStateStatus.success:
        return builder(response.data as T);
      case UIStateStatus.error:
        return Center(child: errorWidget ?? Text(response.message ?? "Hata"));
    }
  }
}
