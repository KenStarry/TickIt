import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickit/core/di/locator.dart';
import 'package:tickit/core/domain/repository/shared_prefs_repository.dart';

import '../../../../core/presentation/components/custom_network_image.dart';
import '../../../../core/utils/extensions/context_extensions.dart';
import '../../../dashboard/presentation/components/global_overlay.dart';
import '../components/user_profile_header.dart';
import '../components/user_profile_settings_section.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController controller;

  double toolbarHeight = 75;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showNavigation.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: context.colors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                            ),
                            child: Image.asset(
                              "assets/images/bg3.png",
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: UserProfileHeader(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16)),

            /// Profile Details
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'Rebecca M.',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          locator
                                  .get<SharedPrefsRepository>()
                                  .getEmail
                                  .isNotEmpty
                              ? locator.get<SharedPrefsRepository>().getEmail
                              : "No Email",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: context.colors.textBlack600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            UserProfileSettingsSection(),

            SliverToBoxAdapter(child: SizedBox(height: 150)),
          ],
        ),
      ),
    );
  }
}
