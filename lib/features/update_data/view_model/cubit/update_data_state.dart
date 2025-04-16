part of 'update_data_cubit.dart';

@immutable
sealed class UpdateDataState {}

final class UpdateDataInitial extends UpdateDataState {}

final class LoadingUpdateProfileDataState extends UpdateDataState {}

final class SuccessfullyUpdateProfileDataState extends UpdateDataState {
  final String message;
  final bool status;
  SuccessfullyUpdateProfileDataState({
    required this.message,
    required this.status,
  });
}

final class ErrorUpdateProfileDataState extends UpdateDataState {
  final String error;
  ErrorUpdateProfileDataState({required this.error});
}
