import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

abstract class TicketsRepository {
  Future<List<TicketModel>> fetchTickets();
}