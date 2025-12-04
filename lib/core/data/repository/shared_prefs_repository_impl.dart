import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickit/core/domain/repository/shared_prefs_repository.dart';

import '../../di/locator.dart';

class SharedPrefsRepositoryImpl extends SharedPrefsRepository {
  final sharedPrefs = locator.get<SharedPreferences>();

  @override
  String get getLoginToken => sharedPrefs.getString("token") ?? '';

  @override
  Future<void> setLoginToken(String token) async {
    await sharedPrefs.setString("token", token);
  }
}
