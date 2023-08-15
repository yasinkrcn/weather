import '../../../../core/_core_exports.dart';

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final double? size;
  const WeatherIcon({
    super.key,
    required this.iconCode,
    this.size = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: CachedNetworkImage(
        height: size,
        width: size,
        imageUrl: "https://openweathermap.org/img/wn/$iconCode@4x.png",
      ),
    );
  }
}
