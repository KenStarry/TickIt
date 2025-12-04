part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginUserEvent extends LoginEvent {
  final String userEmail;
  final String password;

  LoginUserEvent({required this.userEmail, required this.password});
}

final class LogoutUserEvent extends LoginEvent {}
