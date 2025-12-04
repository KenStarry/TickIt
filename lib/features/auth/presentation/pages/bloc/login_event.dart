part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginUserEvent extends LoginEvent {
  final String userEmail;

  LoginUserEvent({required this.userEmail});
}

final class LogoutUserEvent extends LoginEvent {}
