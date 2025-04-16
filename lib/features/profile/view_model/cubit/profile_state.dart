part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadingGetProfileDataState extends ProfileState {}

final class SuccessfullyGetProfileDataState extends ProfileState {
  final String message;
  final bool status;
  SuccessfullyGetProfileDataState({
    required this.message,
    required this.status,
  });
}

final class ErrorGetProfileDataState extends ProfileState {
  final String error;
  ErrorGetProfileDataState(this.error);
}
