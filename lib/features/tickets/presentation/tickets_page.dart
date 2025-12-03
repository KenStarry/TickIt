import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/core/presentation/components/custom_network_image.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/tickets/presentation/components/ticket_card.dart';

import '../domain/model/ticket_model.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final List<TicketModel> dummyTickets = [
    TicketModel(
      ticketId: 'tkt_001',
      ticketTitle: 'Avengers End-Game',
      ticketCoverUrl:
          'https://i.pinimg.com/1200x/bd/9b/66/bd9b66f90280b82444ba9898841c3f0e.jpg',
      ticketAmount: 150,
    ),
    TicketModel(
      ticketId: 'tkt_002',
      ticketTitle: 'Spiderman, No Way Home',
      ticketCoverUrl:
          "https://i.pinimg.com/1200x/94/a6/a1/94a6a129e3a9e54495805d5e545e356f.jpg",
      ticketAmount: 45,
    ),
    TicketModel(
      ticketId: 'tkt_003',
      ticketTitle: 'Superman v Batman',
      ticketCoverUrl:
          "https://i.pinimg.com/736x/ee/09/4d/ee094dfbbf0d85fdc720bcfc5d7cf38b.jpg",
      ticketAmount: 80,
    ),
    TicketModel(
      ticketId: 'tkt_004',
      ticketTitle: 'Rio 2',
      ticketCoverUrl:
          "https://i.pinimg.com/1200x/f5/4b/15/f54b1561caf346898654f1ec7b444cc0.jpg",
      ticketAmount: 25,
    ),
    TicketModel(
      ticketId: 'tkt_005',
      ticketTitle: 'The Flash',
      ticketCoverUrl:
          "https://i.pinimg.com/736x/ec/fb/0a/ecfb0a7f995a44b816fbff95bf7b0ee8.jpg",
      ticketAmount: 120,
    ),
    TicketModel(
      ticketId: 'tkt_006',
      ticketTitle: 'Croods 2',
      ticketCoverUrl:
          "https://i.pinimg.com/736x/f5/bb/13/f5bb1362871ac8422261a5ea627732e9.jpg",
      ticketAmount: 60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .start,
                spacing: 16,
                children: [
                  IconButton(
                    onPressed: () {},
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
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/svg/bell.svg",
                            width: 26,
                            height: 26,
                            colorFilter: .mode(
                              context.colors.iconColor,
                              .srcIn,
                            ),
                          ),
                        ),

                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: .circular(12),
                          ),
                          child: CustomNetworkImage(
                            url:
                                "https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            borderRadius: .circular(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              backgroundColor: context.colors.backgroundColor,
              surfaceTintColor: context.colors.backgroundColor,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),

            SliverToBoxAdapter(
              child: Text("My Shows", style: context.textTheme.titleLarge?.copyWith(
                fontWeight: .w700,
                color: context.colors.textBlack600
              )),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16)),
            //  All Tickets
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    TicketCard(ticketModel: dummyTickets[index]),
                childCount: dummyTickets.length,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        ),
      ),
    );
  }
}
