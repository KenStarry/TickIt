import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/di/locator.dart';
import '../../../../core/presentation/components/avatar.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

class UserProfileHeader extends StatefulWidget {
  const UserProfileHeader({super.key});

  @override
  State<UserProfileHeader> createState() => _UserProfileHeaderState();
}

class _UserProfileHeaderState extends State<UserProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: context.colors.backgroundColor, width: 5),
                ),
                child: UserAvatar(
                  imageUrl: 'https://plus.unsplash.com/premium_photo-1688350808212-4e6908a03925?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  size: Size(120, 120),
                  crownSize: Size(35, 35),
                  onTap: () {
                    // context.read<AuthBloc>().add(AuthSignOutEvent());
                  },
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  GestureDetector(
                    onTap: () {
                      // openWidget();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: context.colors.backgroundColor,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        border: Border.all(
                          color: context.colors.grey200,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/login.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            context.colors.iconColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
