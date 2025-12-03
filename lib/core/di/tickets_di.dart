import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tickit/features/tickets/data/repository/tickets_repository_impl.dart';
import 'package:tickit/features/tickets/domain/repository/tickets_repository.dart';
import 'package:tickit/features/tickets/domain/use_case/fetch_tickets.dart';
import 'package:tickit/features/tickets/domain/use_case/tickets_use_cases.dart';

Future<void> setupTicketsDI(GetIt locator) async {
  /// Repository
  locator.registerLazySingleton<TicketsRepository>(
    () => TicketsRepositoryImpl(),
  );

  /// Use Case
  locator.registerLazySingleton<TicketsUseCases>(
    () => TicketsUseCases(fetchTickets: FetchTickets()),
  );
}
