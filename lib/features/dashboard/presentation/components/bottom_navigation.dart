import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/extensions/context_extensions.dart';
import '../../domain/model/navigation_item.dart';
import '../cubit/navigation_cubit.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<NavigationItem> items = [
    NavigationItem(
        title: "Tickets",
        asset: "assets/svg/ticket.svg",
        assetActive: "assets/svg/ticket_filled.svg"),
    NavigationItem(
        title: "Profile",
        asset: "assets/svg/profile.svg",
        assetActive: "assets/svg/profile_filled.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTabTitle =
        context.select<NavigationCubit, String>((s) => s.state.title);

    return Padding(
      padding: const .only(bottom: 32, left: 16, right: 16),
      child: ClipRRect(
        borderRadius: .circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            // width: double.infinity,
            height: 70,
            padding: const .symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: .circular(100),
              color: context.colors.surfaceColor.withValues(alpha: 0.3)
            ),
            child: Row(
              children: items.map((item) {
                final isActive = currentTabTitle == item.title;
                final currentIndex =
                    items.map((item) => item.title).toList().indexOf(item.title);

                return Expanded(
                    child: GestureDetector(
                  onTap: () {
                    switch (item.title) {
                      case 'Tickets':
                        rootNavKey.currentContext?.goNamed('tickets');
                        context
                            .read<NavigationCubit>()
                            .setTab(TabModel(title: "Tickets", index: 0));
                        break;
                      case 'Profile':
                        rootNavKey.currentContext?.goNamed('profile');
                        context
                            .read<NavigationCubit>()
                            .setTab(TabModel(title: "Profile", index: 1));
                        break;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: isActive ? context.colors.primaryColor : Colors.transparent,
                      borderRadius: .circular(100)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(isActive ? item.assetActive : item.asset,
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                                isActive
                                    ? context.colors.onPrimaryColor
                                    : context.colors.textBlack600,
                                BlendMode.srcIn)),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isActive
                                  ? context.colors.onPrimaryColor
                                  : context.colors.textBlack600),
                        ),
                      ],
                    ),
                  )
                      .animate(autoPlay: true, delay: Duration(milliseconds: 350))
                      .fadeIn(
                          duration: Duration(milliseconds: 350),
                          delay: Duration(milliseconds: 100 * currentIndex))
                      .moveY(
                          begin: 50,
                          end: 0,
                          duration: Duration(milliseconds: 350),
                          delay: Duration(milliseconds: 100 * currentIndex),
                          curve: Curves.ease)
                      .then()
                      .moveY(begin: -5, curve: Curves.ease),
                ));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
