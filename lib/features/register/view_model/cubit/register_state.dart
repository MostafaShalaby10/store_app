part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterChangePasswordVisiability extends RegisterState {}

final class LoadingRegisterState extends RegisterState {}

final class SuccessfullyRegisterState extends RegisterState {
  final bool status;
  final String message;
  SuccessfullyRegisterState({required this.message, required this.status});
}

final class ErrorRegisterState extends RegisterState {
  final String error;
  ErrorRegisterState(this.error);
}
