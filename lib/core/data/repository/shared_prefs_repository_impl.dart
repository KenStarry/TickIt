import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickit/core/domain/repository/shared_prefs_repository.dart';

import '../../di/locator.dart';

class SharedPrefsRepositoryImpl extends SharedPrefsRepository {
  final sharedPrefs = locator.get<SharedPreferences>();

  @override
  String get getLoginToken => sharedPrefs.getString("token") ?? '';

  @override
  String get getEmail => sharedPrefs.getString("email") ?? '';

  @override
  Future<void> setLoginToken(String token, {required String email}) async {
    await sharedPrefs.setString("token", token);
    await sharedPrefs.setString("email", email);
  }
}
