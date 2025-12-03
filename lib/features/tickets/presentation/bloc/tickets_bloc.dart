import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tickit/core/di/locator.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/domain/use_case/tickets_use_cases.dart';

part 'tickets_event.dart';

part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final ticketsUseCase = locator.get<TicketsUseCases>();

  TicketsBloc() : super(TicketsInitial()) {
    on<FetchTicketsEvent>(_fetchTickets);
  }

  Future<void> _fetchTickets(
    FetchTicketsEvent event,
    Emitter<TicketsState> emit,
  ) async {
    try {
      emit(TicketsLoading());

      final tickets = await ticketsUseCase.fetchTickets.call();

      emit(TicketsSuccess(tickets: tickets));
    } catch (error) {
      emit(TicketsFailed(errorMessage: error.toString()));
    }
  }
}
