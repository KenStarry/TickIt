import 'package:get_it/get_it.dart';

import 'core_di.dart';

final locator = GetIt.instance;

/// This function is used to register all the dependencies in the app.
Future<void> setupLocator() async {
  await setupCoreDI(locator);
}