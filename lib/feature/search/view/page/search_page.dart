import 'package:weather/core/extension/timestamp_day_to_hours_and_minute_extension.dart';
import 'package:weather/feature/home/view/widgets/weather_icon.dart';
import 'package:weather/feature/home/view/widgets/weather_other_things.dart';
import 'package:weather/feature/home/view_model/home_view_model.dart';
import '../../../../core/_core_exports.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Consumer(
      builder: (context, HomeViewModel homeViewModel, child) {
        return AppScaffold(
          body: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade200,
                  Colors.blue.shade400,
                  Colors.blue.shade600,
                  Colors.blue.shade800,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
