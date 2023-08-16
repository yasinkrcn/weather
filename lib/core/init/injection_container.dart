import 'package:weather/core/utils/remote_data_source/data/repository/network_manager.dart';
import 'package:weather/core/utils/remote_data_source/dio_manager.dart';
import 'package:weather/feature/bottom_nav_bar/view_model/bottom_navigation_bar_view_model.dart';
import 'package:weather/feature/home/data/repo/home_repo_impl.dart';
import 'package:weather/feature/home/view_model/home_view_model.dart';

import '../_core_exports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Dio

  sl.registerFactory<Dio>(() => DioManager.getDio());
  sl.registerLazySingleton<INetworkManager>(() => NetworkManager(sl<Dio>()));

  sl.registerLazySingleton<ScreenSize>(() => ScreenSize());

  //SharedPreferences

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<SharedPreferencesRepository>(() => SharedPreferencesRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetDataFromKey(sl()));
  sl.registerLazySingleton(() => RemoveDataFromKey(sl()));
  sl.registerLazySingleton(() => SaveDataFromKey(sl()));

  //Repositories

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  //ViewModels
  //sl.registerLazySingleton<LoginViewModel>(() => LoginViewModel());

  sl.registerLazySingleton<HomeViewModel>(() => HomeViewModel(homeRepo: sl<HomeRepository>()));

  sl.registerLazySingleton<BottomNavBarViewModel>(() => BottomNavBarViewModel());

  // sl.registerLazySingleton<RegisterViewModel>(
  //   () => RegisterViewModel(
  //     authRepository: sl<AuthRepository>(),
  //   ),
  // );
  // sl.registerLazySingleton<SplashViewModel>(
  //   () => SplashViewModel(
  //     getDataFromKey: sl<GetDataFromKey>(),
  //     saveDataFromKey: sl<SaveDataFromKey>(),
  //   ),
  // );
}
