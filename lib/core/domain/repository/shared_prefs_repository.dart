abstract class SharedPrefsRepository {
  Future<void> setLoginToken(String token);

  String get getLoginToken;
}
