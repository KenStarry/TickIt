import 'package:flutter/material.dart';
import 'package:tickit/core/theme/models/theme_config.dart';
import 'package:tickit/core/theme/tickit_theme.dart';

import 'core/di/locator.dart';
import 'core/routing/app_router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const TickIt());
}

class TickIt extends StatelessWidget {
  const TickIt({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kPrimaryBrandColor = Color(0xFF9237db);

    final TickItThemeConfig lightConfig = resolveTheme(
      brightness: Brightness.light,
      seedColor: kPrimaryBrandColor,
    );

    final TickItThemeConfig darkConfig = resolveTheme(
      brightness: Brightness.dark,
      seedColor: kPrimaryBrandColor,
    );

    return MaterialApp.router(
      title: 'TickIt',
      theme: buildTheme(lightConfig),
      darkTheme: buildTheme(darkConfig),
      themeMode: ThemeMode.system,
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
