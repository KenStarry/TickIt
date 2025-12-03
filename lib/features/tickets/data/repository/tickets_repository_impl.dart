import 'package:dio/dio.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:tickit/core/di/locator.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/domain/repository/tickets_repository.dart';

import '../../../../core/utils/classes/random_generator.dart';

class TicketsRepositoryImpl extends TicketsRepository {
  final _dio = locator.get<Dio>();

  @override
  Future<List<TicketModel>> fetchTickets() async {
    final result = await _dio.get("https://jsonplaceholder.typicode.com/posts");

    if (result.statusCode == 200) {
      final generator = RandomGenerator();
      final dataList = result.data as List<dynamic>;

      return dataList.asMap().entries.map((entry) {
        final i = entry.key; // The index of the ticket in the list (0 to 99)
        final item = entry.value;
        final categoryId = (i ~/ 20) + 1;

        return TicketModel.fromJson(item).copyWith(
          ticketCategoryId: 'cat_00$categoryId',
          ticketResolved: false,
          ticketUserAvatarUrl: generator
              .generateRandomString(10)
              .avatar(
                style: DiceBearStyle.adventurer,
                type: DiceBearImageType.svg,
              ),
        );
      }).toList();
    } else {
      throw Exception("Could Not Fetch Tickets");
    }
  }
}
