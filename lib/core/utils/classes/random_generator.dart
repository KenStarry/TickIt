import 'dart:math';

class RandomGenerator {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  /// Generates a cryptographically secure random string of a given length.
  ///
  /// The string is composed of uppercase letters, lowercase letters, and digits.
  ///
  /// [length]: The desired length of the random string.
  /// Returns: A string of the specified length.
  String generateRandomString(int length) {
    if (length <= 0) {
      return '';
    }

    // Use List.generate for efficient string creation
    return String.fromCharCodes(Iterable.generate(
        length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))
    ));
  }
}