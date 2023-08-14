import '../../../../core/_core_exports.dart';

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  const WeatherIcon({
    super.key,
    required this.iconCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: CachedNetworkImage(
        imageUrl: "https://openweathermap.org/img/wn/$iconCode@4x.png",
      ),
    );
  }
}
