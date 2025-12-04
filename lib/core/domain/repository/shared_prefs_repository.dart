abstract class SharedPrefsRepository {
  Future<void> setLoginToken(String token, {required String email});

  String get getLoginToken;
  String get getEmail;
}
