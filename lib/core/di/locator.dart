import 'package:get_it/get_it.dart';
import 'package:tickit/core/di/tickets_di.dart';

import 'core_di.dart';

final locator = GetIt.instance;

/// This function is used to register all the dependencies in the app.
Future<void> setupLocator() async {
  await setupCoreDI(locator);
  await setupTicketsDI(locator);
}