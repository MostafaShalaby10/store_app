part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadingGetProfileDataState extends ProfileState {}

final class SuccessfullyGetProfileDataState extends ProfileState {
  final bool status;
  SuccessfullyGetProfileDataState({required this.status});
}

final class ErrorGetProfileDataState extends ProfileState {
  final String error;
  ErrorGetProfileDataState(this.error);
}

final class LoadingLogOutState extends ProfileState {}

final class SuccessfullyLogOutState extends ProfileState {
  final bool status;
  final dynamic message;
  SuccessfullyLogOutState({required this.status, required this.message});
}

final class ErrorLogOutState extends ProfileState {
  final String error;
  ErrorLogOutState(this.error);
}
