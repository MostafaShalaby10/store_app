part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChangePasswordVisibilityState extends LoginState {}

final class LoadingLoginFunction extends LoginState {}

final class SuccessfullyLoginFunction extends LoginState {
  final bool status; 
  final String message;
  SuccessfullyLoginFunction({required this.message, required this.status});
}

final class ErrorLoginFunction extends LoginState {
  final String error;
  ErrorLoginFunction(this.error);
}
