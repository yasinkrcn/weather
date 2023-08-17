import 'package:shimmer/shimmer.dart';
import 'package:weather/core/_core_exports.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.blue.withOpacity(.5),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 250.w,
              color: Colors.white,
            ),
            AppSizedBox.h(16),
            Container(
              height: 175,
              width: double.infinity,
              color: Colors.white,
            ),
            AppSizedBox.h(16),
            Container(
              height: 50,
              width: 250.w,
              color: Colors.white,
            ),
            AppSizedBox.h(16),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
            ),
            AppSizedBox.h(16),
            Container(
              height: 50,
              width: 250.w,
              color: Colors.white,
            ),
            AppSizedBox.h(16),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
