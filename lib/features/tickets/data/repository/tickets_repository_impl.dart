import 'package:dio/dio.dart';
import 'package:tickit/core/di/locator.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/domain/repository/tickets_repository.dart';

class TicketsRepositoryImpl extends TicketsRepository {
  final _dio = locator.get<Dio>();

  @override
  Future<List<TicketModel>> fetchTickets() async {
    final result = await _dio.get("https://jsonplaceholder.typicode.com/posts");

    if (result.statusCode == 200) {
      return (result.data as List<dynamic>)
          .map((item) => TicketModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Could Not Fetch Tickets");
    }
  }
}
