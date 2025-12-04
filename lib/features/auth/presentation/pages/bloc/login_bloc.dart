import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/core/di/locator.dart';
import 'package:tickit/core/domain/repository/shared_prefs_repository.dart';
import 'package:tickit/core/routing/app_router.dart';
import 'package:uuid/uuid.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final repo = locator.get<SharedPrefsRepository>();

  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(_login);
    on<LogoutUserEvent>(_logout);
  }

  Future<void> _login(
      LoginUserEvent event,
      Emitter<LoginState> emit,
      ) async {
    try {
      emit(LoginLoading());

      final String token = Uuid().v4();

      await Future.delayed(
        const Duration(seconds: 2),
      );

      if (event.password != "Pass123") {
        throw Exception("Incorrect Email or Password");
      }

      await repo.setLoginToken(token, email: event.userEmail);

      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }

  Future<void> _logout(
      LogoutUserEvent event,
      Emitter<LoginState> emit,
      ) async {
    try {
      await repo.setLoginToken("", email: "");
      rootNavKey.currentContext?.goNamed('onboarding');
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }
}
