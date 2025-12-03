import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> setupCoreDI(GetIt locator) async {
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
