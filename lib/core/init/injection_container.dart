import 'package:weather/feature/search/view_model/search_view_model.dart';

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
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());

  //ViewModels
  //sl.registerLazySingleton<LoginViewModel>(() => LoginViewModel());

  sl.registerLazySingleton<BottomNavBarViewModel>(() => BottomNavBarViewModel());

  sl.registerLazySingleton<HomeViewModel>(() => HomeViewModel(homeRepo: sl<HomeRepository>()));
  sl.registerLazySingleton<SearchViewModel>(() => SearchViewModel(searchRepo: sl<SearchRepository>()));
}
