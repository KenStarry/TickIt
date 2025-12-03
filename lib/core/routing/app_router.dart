import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/features/onboarding/presentation/onboarding.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

final onboardingRoute = GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (context, state) => Onboarding());

/// app route configuration
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: "/onboarding",
  // redirect: (context, state) async {
  //
  //   return null;
  // },
  routes: <RouteBase>[
    onboardingRoute,
  ],
);
