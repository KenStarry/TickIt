import 'package:tickit/core/di/locator.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/domain/repository/tickets_repository.dart';

class FetchTickets {
  final repo = locator.get<TicketsRepository>();

  Future<List<TicketModel>> call() async => await repo.fetchTickets();
}
