import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/_core_exports.dart';
import 'package:weather/core/constants/main_provider_list.dart';

import 'package:weather/core/init/injection_container.dart' as locator;
import 'package:weather/feature/home/view/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await locator.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.getMainProviderList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: generateRoute,
      navigatorKey: GlobalContextKey.instance.globalKey,
      home: HomePage(),
    );
  }
}
