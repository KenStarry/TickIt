import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:tickit/core/theme/models/theme_config.dart';
import 'package:tickit/core/theme/tickit_theme.dart';
import 'package:tickit/features/dashboard/presentation/cubit/feedback_cubit.dart';
import 'package:tickit/features/dashboard/presentation/cubit/navigation_cubit.dart';
import 'package:tickit/features/tickets/presentation/bloc/ticket_resolver_cubit.dart';
import 'package:tickit/features/tickets/presentation/bloc/tickets_bloc.dart';

import 'core/di/locator.dart';
import 'core/routing/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/dashboard/presentation/components/global_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await path_provider.getApplicationDocumentsDirectory();

  await setupLocator();
  await Hive.initFlutter(dir.path);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TicketsBloc()),
        BlocProvider(create: (context) => TicketResolverCubit()),
        BlocProvider(create: (context) => FeedbackCubit()),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: const TickIt(),
    ),
  );
}

class TickIt extends StatelessWidget {
  const TickIt({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kPrimaryBrandColor = Color(0xFF00b4d8);

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
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) =>
                  GlobalOverlay(child: child ?? SizedBox.shrink()),
            ),
          ],
        );
      },
    );
  }
}
