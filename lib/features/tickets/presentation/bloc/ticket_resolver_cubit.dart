import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

class TicketResolverCubit extends Cubit<Set<String>> {
  static const _boxName = 'resolved_tickets';
  late final Box _box;

  TicketResolverCubit() : super({}) {
    _init();
  }

  /// Initialize the Cubit
  Future<void> _init() async {
    _box = await Hive.openBox(_boxName);
    final resolved = _box.get('ids', defaultValue: <String>[]);
    emit(Set<String>.from(resolved));
  }

  Future<void> toggleResolve(String ticketId) async {
    final current = Set<String>.from(state);

    if (current.contains(ticketId)) {
      current.remove(ticketId);
    } else {
      current.add(ticketId);
    }

    await _box.put('ids', current.toList());
    emit(current);
  }

  bool isResolved(String ticketId) => state.contains(ticketId);
}
