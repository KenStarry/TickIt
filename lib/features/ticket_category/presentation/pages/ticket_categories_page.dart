import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/ticket_category/presentation/components/ticket_category_card_alt.dart';
import 'package:tickit/features/tickets/presentation/bloc/tickets_bloc.dart';
import '../../../../core/presentation/components/avatar.dart';
import '../../../../core/utils/extensions/widget_extensions.dart';
import '../../../dashboard/domain/enum/feedback_enum.dart';
import '../../../dashboard/presentation/components/global_overlay.dart';
import '../../../dashboard/presentation/cubit/feedback_cubit.dart';
import '../../../dashboard/presentation/cubit/navigation_cubit.dart';
import '../../domain/model/ticket_category_model.dart';
import '../components/ticket_category_card.dart';

class TicketCategoriesPage extends StatefulWidget {
  const TicketCategoriesPage({super.key});

  @override
  State<TicketCategoriesPage> createState() => _TicketCategoriesPageState();
}

class _TicketCategoriesPageState extends State<TicketCategoriesPage> {
  bool isList = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  final List<TicketCategoryModel> dummyCategorys = [
    TicketCategoryModel(
      categoryId: 'cat_001',
      categoryTitle: 'Service Outage & Connectivity',
      categoryCoverUrl:
          'https://i.pinimg.com/1200x/bd/9b/66/bd9b66f90280b82444ba9898841c3f0e.jpg',
      categoryAsset: "assets/images/bg_1.png",
      categoryAmount: 150,
    ),
    TicketCategoryModel(
      categoryId: 'cat_004',
      categoryTitle: 'Billing & Account Management',
      categoryCoverUrl:
          "https://i.pinimg.com/1200x/f5/4b/15/f54b1561caf346898654f1ec7b444cc0.jpg",
      categoryAsset: "assets/images/bg_4.png",
      categoryAmount: 25,
    ),
    TicketCategoryModel(
      categoryId: 'cat_003',
      categoryTitle: 'Equipment & Installation',
      categoryCoverUrl:
          "https://i.pinimg.com/736x/ee/09/4d/ee094dfbbf0d85fdc720bcfc5d7cf38b.jpg",
      categoryAsset: "assets/images/bg_3.png",
      categoryAmount: 80,
    ),
    TicketCategoryModel(
      categoryId: 'cat_002',
      categoryTitle: 'Performance & Speed',
      categoryCoverUrl:
          "https://i.pinimg.com/1200x/94/a6/a1/94a6a129e3a9e54495805d5e545e356f.jpg",
      categoryAsset: "assets/images/bg_2.png",
      categoryAmount: 45,
    ),
    TicketCategoryModel(
      categoryId: 'cat_005',
      categoryTitle: 'Credentials & Security',
      categoryCoverUrl:
          "https://i.pinimg.com/736x/ec/fb/0a/ecfb0a7f995a44b816fbff95bf7b0ee8.jpg",
      categoryAsset: "assets/images/bg_5.png",
      categoryAmount: 120,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _onRefresh();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showNavigation.value = true;
    });
  }

  void _onRefresh() async {
    context.read<TicketsBloc>().add(FetchTicketsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketsBloc, TicketsState>(
      listener: (context, ticketsState) {
        if (ticketsState is TicketsSuccess) {
          _refreshController.refreshCompleted();
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.backgroundColor,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .start,
              spacing: 16,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<FeedbackCubit>().show(
                      "My first task as your new Engineer: finish this screen. ✅",
                      type: FeedbackType.info,
                    );
                  },
                  icon: SvgPicture.asset(
                    "assets/svg/menu.svg",
                    width: 26,
                    height: 26,
                    colorFilter: .mode(context.colors.iconColor, .srcIn),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .center,
                    spacing: 16,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<FeedbackCubit>().show(
                            "My first task as your new Engineer: finish this screen. ✅",
                            type: FeedbackType.info,
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/svg/bell.svg",
                          width: 26,
                          height: 26,
                          colorFilter: .mode(context.colors.iconColor, .srcIn),
                        ),
                      ),

                      UserAvatar(
                        imageUrl:
                            'https://plus.unsplash.com/premium_photo-1688350808212-4e6908a03925?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        size: Size(45, 45),
                        onTap: () {
                          context.goNamed("profile");
                          context.read<NavigationCubit>().setTab(
                            TabModel(title: "Profile", index: 1),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: context.colors.backgroundColor,
          surfaceTintColor: context.colors.backgroundColor,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 24)),

                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ticket Categories",
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: .w700,
                              color: context.colors.textBlack800,
                            ),
                          ),
                        ),

                        //  Toggler
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: .circular(100),
                            color: context.colors.surfaceColor,
                          ),
                          child: Row(
                            crossAxisAlignment: .center,
                            mainAxisAlignment: .center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isList = false;
                                  });
                                },
                                icon: SvgPicture.asset(
                                  "assets/svg/gridview_${isList ? 'outlined' : 'filled'}.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    isList
                                        ? context.colors.grey500
                                        : Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isList = true;
                                  });
                                },
                                icon: SvgPicture.asset(
                                  "assets/svg/listview_${isList ? 'filled' : 'outlined'}.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    isList
                                        ? Theme.of(context).colorScheme.primary
                                        : context.colors.grey500,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  //  All Categorys
                  BlocBuilder<TicketsBloc, TicketsState>(
                    builder: (context, ticketsState) {
                      final isLoading = ticketsState is TicketsLoading;
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => AnimatedSwitcher(
                            duration: 500.milliSeconds,
                            child: isList
                                ? TicketCategoryCardAlt(
                                    ticketModel: dummyCategorys[index],
                                    isLoading: isLoading,
                                  )
                                : TicketCategoryCard(
                                    ticketModel: dummyCategorys[index],
                                  ),
                          ),
                          childCount: dummyCategorys.length,
                        ),
                      );
                    },
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 200)),
                ],
              ).refreshIndicator(
                context,
                controller: _refreshController,
                onRefresh: _onRefresh,
              ),
        ),
      ),
    );
  }
}
