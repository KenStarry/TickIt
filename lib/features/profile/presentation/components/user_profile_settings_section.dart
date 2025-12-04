import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/locator.dart';
import '../../../../core/presentation/components/material_motion.dart';
import '../../../../core/utils/extensions/context_extensions.dart';
import '../../../auth/presentation/pages/bloc/login_bloc.dart';
import '../../../dashboard/domain/enum/feedback_enum.dart';
import '../../../dashboard/presentation/cubit/feedback_cubit.dart';
import '../../../dashboard/presentation/cubit/navigation_cubit.dart';
import '../model/setting_card_model.dart';

class UserProfileSettingsSection extends StatefulWidget {
  const UserProfileSettingsSection({super.key});

  @override
  State<UserProfileSettingsSection> createState() =>
      _UserProfileSettingsSectionState();
}

class _UserProfileSettingsSectionState
    extends State<UserProfileSettingsSection> {
  final List<Map<String, dynamic>> _settings = [
    {
      "title": "Appearance",
      "settings": [
        SettingCardModel(
          label: "Themes",
          iconPath: "assets/3d/settings/themes_3d.png",
        ),
      ],
    },

    {
      "title": "General",
      "settings": [
        SettingCardModel(
          label: "Notifications",
          iconPath: "assets/3d/headers/notification_3d.png",
        ),
        SettingCardModel(
          label: "Security",
          iconPath: "assets/3d/settings/security_3d.png",
        ),
      ],
    },

    {
      "title": "Support",
      "settings": [
        SettingCardModel(
          label: "Help Center",
          iconPath: "assets/3d/settings/help_3d.png",
        ),
        SettingCardModel(
          label: "Rate the App",
          iconPath: "assets/3d/settings/rate_3d.png",
        ),
      ],
    },

    {
      "title": "Legal & Policies",
      "settings": [
        SettingCardModel(
          label: "Licenses",
          iconPath: "assets/3d/receipt_3d.png",
        ),
        SettingCardModel(
          label: "Terms & Conditions",
          iconPath: "assets/3d/settings/terms_3d.png",
        ),
        SettingCardModel(
          label: "Privacy Policy",
          iconPath: "assets/3d/settings/privacy_policy_3d.png",
        ),
      ],
    },

    {
      "title": "Account",
      "settings": [
        SettingCardModel(
          label: "Logout",
          iconPath: "assets/3d/settings/logout_3d.png",
        ),
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverMainAxisGroup(
        slivers: [

          ..._settings
          // .sublist(0, _settings.length - 1)
          .map(
            (setting) => SliverPadding(
              padding: const EdgeInsets.only(bottom: 24),
              sliver: DecoratedSliver(
                decoration: BoxDecoration(
                  color: context.colors.backgroundColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        setting['title'],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 16)),
                    DecoratedSliver(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: context.colors.surfaceColor,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final settingCard =
                                (setting['settings']
                                    as List<SettingCardModel>)[index];
                            return  addMaterialContainerMotion(
                              context,
                              closedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              closedBuilder: (context, openWidget) => ListTile(
                                leading: Image.asset(
                                  settingCard.iconPath,
                                  width: 32,
                                  height: 32,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                title: Text(
                                  settingCard.label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    "assets/svg/chevron_right.svg",
                                    width: double.infinity,
                                    height: double.infinity,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.color!,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  switch (settingCard.label) {
                                    case "Logout":
                                      context.read<LoginBloc>().add(LogoutUserEvent());

                                      context.read<FeedbackCubit>().show(
                                        "You have been Logged Out",
                                        type: FeedbackType.success,
                                      );

                                      context
                                          .read<NavigationCubit>()
                                          .setTab(TabModel(title: "Tickets", index: 0));
                                      break;
                                    default:
                                      context.read<FeedbackCubit>().show(
                                        "Don't worry. This is coming soon!",
                                        type: FeedbackType.info,
                                      );
                                      break;
                                  }
                                },
                              ),
                              openBuilder: (context, closeWidget) =>
                              switch (settingCard.label) {
                                _ => Text("Coming Soon"),
                              }, onClosed: (Never? p1) {  },
                            );
                          },
                          childCount:
                              (setting['settings'] as List<SettingCardModel>)
                                  .length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
