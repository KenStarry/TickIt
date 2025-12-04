import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/features/onboarding/presentation/onboarding.dart';
import 'package:tickit/features/profile/presentation/pages/user_profile_page.dart';
import 'package:tickit/features/ticket_category/presentation/pages/ticket_categories_page.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

final onboardingRoute = GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (context, state) => Onboarding());

final ticketsRoute = GoRoute(
    path: '/tickets',
    name: 'tickets',
    builder: (context, state) => TicketCategoriesPage());

final profileRoute = GoRoute(
    path: '/profile',
    name: 'profile',
    builder: (context, state) => UserProfilePage());

/// app route configuration
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: "/profile",
  // redirect: (context, state) async {
  //
  //   return null;
  // },
  routes: <RouteBase>[
    onboardingRoute,
    ticketsRoute,
    profileRoute
  ],
);
