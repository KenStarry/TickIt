import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/shared_prefs_repository_impl.dart';
import '../domain/repository/shared_prefs_repository.dart';

Future<void> setupCoreDI(GetIt locator) async {
  /// Shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  locator.registerLazySingleton<SharedPrefsRepository>(
    () => SharedPrefsRepositoryImpl(),
  );

  /// DIO
  locator.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 260),
        sendTimeout: Duration(seconds: 260),
        receiveTimeout: Duration(seconds: 260),
        contentType: 'application/json',
      ),
    );
  });
}
